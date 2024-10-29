//
//  NotificationService.swift
//  notifications
//
//  Created by Armend Hasani on 22.5.23.
//  Copyright © 2023 Futurae. All rights reserved.
//

import UserNotifications
import FuturaeKit

class NotificationService: UNNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    var config: FTRConfig {
        let allowChangePinIsOn = UserDefaults.custom.bool(forKey: "allowChangePin")
        let deactivateBiometricsAfterChangePinIsOn = UserDefaults.custom.bool(forKey: "deactivateBiometricsAfterChangePin")
        let type = LockConfigurationType.none
        
        return FTRConfig(sdkId: SDKConstants.SDKID,
                               sdkKey: SDKConstants.SDKKEY,
                               baseUrl: SDKConstants.SDKURL,
                         keychain: FTRKeychainConfig(accessGroup: SDKConstants.KEYCHAIN_ACCESS_GROUP, itemsAccessibility: .whenUnlockedThisDeviceOnly),
                               lockConfiguration: LockConfiguration(type: type,
                                                                    unlockDuration: 60,
                                                                    invalidatedByBiometricsChange: true,
                                                                    pinConfiguration: .init(allowPinChangeWithBiometricUnlock: allowChangePinIsOn, deactivateBiometricsAfterPinChange: deactivateBiometricsAfterChangePinIsOn))
                               ,appGroup: SDKConstants.APP_GROUP)
    }
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        guard let bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent) else {
            contentHandler(request.content)
            return
        }
        
        try! FTRClient.launch(config: config)
        
        if let encrypted = bestAttemptContent.userInfo[SDKConstants.EXTRA_INFO_ENC_KEY] as? String,
           let userId = bestAttemptContent.userInfo[SDKConstants.USER_ID_KEY] as? String {
            if let decrypted = try? FTRClient.shared.decryptExtraInfo(encrypted, userId: userId) {
                bestAttemptContent.body =  decrypted.compactMap {
                    "\($0.key): \($0.value)"
                }.joined(separator: ", ")
            }
            
            contentHandler(bestAttemptContent)
            return
        }
        
        if let notificationId = request.content.userInfo["notification_id"] as? String {
            FTRClient.shared.getNotificationData(notificationId) { data in
                bestAttemptContent.body =  data.payload.compactMap {
                    "\($0.key): \($0.value)"
                }.joined(separator: ", ")
                contentHandler(bestAttemptContent)
            } failure: { error in
                bestAttemptContent.body = error.localizedDescription
                contentHandler(bestAttemptContent)
            }
        } else {
            bestAttemptContent.categoryIdentifier = "auth"
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
}
