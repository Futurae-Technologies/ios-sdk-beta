//
//  FunctionsViewController+AccountMigration.swift
//  FuturaeDemo
//
//  Created by Armend Hasani on 8.12.23.
//  Copyright © 2023 Futurae. All rights reserved.
//

import Foundation
import FuturaeKit

extension FunctionsViewController {
    @IBAction func checkAccountMigrationTouchedUpInside(_ sender: UIButton) {
        FTRClient.shared.getMigratableAccounts(success: { [weak self] data in
            let title = "Number of accounts to migrate: \(data.numberOfAccountsToMigrate)"
            var message = data.migratableAccounts.map { $0.username ?? ""}.joined(separator: "\n")
            message += "\nPin protected: \(data.pinProtected ? "true" : "false")"
            message += "\nAdaptive migration enabled: \(data.adaptiveMigrationEnabled ? "true" : "false")"
            
            self?.showAlert(title: title, message: message)
            self?.loadServiceLogo()
        }, failure: { [weak self] error in
            let title = "Checking account migration failed"
            let message = error.localizedDescription
            self?.showAlert(title: title, message: message)
        })
    }

    @IBAction func executeAccountMigrationTouchedUpInside(_ sender: UIButton) {
        executeAccountMigration(withSDKPin: nil)
    }

    @IBAction func executeAccountMigrationWithPinTouchedUpInside(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pinViewController") as? PinViewController else { return }
        vc.pinMode = .input
        vc.didFinishWithPin = { [weak self] pin in
            self?.executeAccountMigration(withSDKPin: pin)
        }

        dismiss(animated: true) {
            self.present(vc, animated: true, completion: nil)
        }
    }

    func executeAccountMigration(withSDKPin sdkPin: String?) {
        FTRClient.shared.migrateAccounts(sdkPin != nil ? MigrationParameters.with(sdkPin: sdkPin!) : MigrationParameters.default(),
                                         success: { [weak self] accountsMigrated in
            let title = "Executing account migration succeeds"
            let usernames = accountsMigrated.map { $0.username ?? "Username N/A" }.joined(separator: "\n")
            let message = "Migrated accounts [\(accountsMigrated.count)]:\n\n\(usernames)"
            self?.showAlert(title: title, message: message)
        }, failure: { [weak self] error in
            let title = "Executing account migration failed"
            let message = error.localizedDescription
            self?.showAlert(title: title, message: message)
        })
    }
}
