//
//  FVC+Adaptive.swift
//  FuturaeDemo
//
//  Created by Armend Hasani on 8.12.23.
//  Copyright © 2023 Futurae. All rights reserved.
//

import Foundation
import FuturaeKit
import FuturaeAdaptiveKit

extension FunctionsViewController {
    @IBAction func adaptiveCollections(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdaptiveViewController") as? AdaptiveViewController {
            present(vc, animated: true, completion: nil)
        }
    }

    @IBAction func enableAdaptive(_ sender: UIButton) {
        FTRAdaptiveClient.shared.enable(with: FTRClient.shared, delegate: self)
        enableAdaptiveButton.isHidden = true
        disableAdaptiveButton.isHidden = false
        UserDefaults.standard.set(true, forKey: "adaptive_enabled")
    }

    @IBAction func disableAdaptive(_ sender: UIButton) {
        FTRAdaptiveClient.shared.disableAdaptive()
        enableAdaptiveButton.isHidden = false
        disableAdaptiveButton.isHidden = true
        UserDefaults.standard.set(false, forKey: "adaptive_enabled")
    }
}

extension FunctionsViewController: FTRAdaptiveClientDelegate {
    func bluetoothSettingStatus() -> FTRAdaptivePermissionStatus {
        .on
    }
    
    func bluetoothPermissionStatus() -> FTRAdaptivePermissionStatus {
        .on
    }
    
    func locationSettingStatus() -> FTRAdaptivePermissionStatus {
        .on
    }
    
    func locationPermissionStatus() -> FTRAdaptivePermissionStatus {
        .on
    }
    
    func locationPrecisePermissionStatus() -> FTRAdaptivePermissionStatus {
        .on
    }
    
    func networkSettingStatus() -> FTRAdaptivePermissionStatus {
        .on
    }
    
    func networkPermissionStatus() -> FTRAdaptivePermissionStatus {
        .on
    }
    
    func didReceiveUpdateWithCollectedData(_ collectedData: [String : Any]) {
        AdaptiveDebugStorage.shared().save(collectedData)
    }
}
