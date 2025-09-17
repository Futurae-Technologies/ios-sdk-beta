# Version 3.8.2-beta
2025-17-09
- [Added] Application Integrity Check feature which automatically transmits integrity verdict information to the backend during during enrollment and authentication. To enable Application Integrity Check Embedded into Enrollment and Authentication flow feature, contact the Futurae support at support@futurae.com.

# Version 3.8.1-beta
2025-02-06
- [Changed]  SDK will track biometrics changes only under biometrics lock configuration or in SDK PIN lock configuration when biometrics are activated

# Version 3.8.0-beta
2025-26-05
- Added new supported URI `FTRURLType.usernamelessAuth` to handle usernameless authentication and transaction confirmation. `FTRUtils` has been enhanced to support this new URI.

# Version 3.7.1-beta
2025-11-03
- [Changed] Added method `getSessionInfoWithoutUnlock` for retrieving session information without prior unlocking and deprecated `getSessionInfoUnprotected`

# Version 3.7.0-beta
2025-10-03
- [Added] Support fetching extra info of an authentication session without prior unlocking the SDK, by exposing a new method `getSessionInfoUnprotected`. Please note that this functionality needs to be enabled for the respective Futurae Service(s) which this SDK is associated with. For further details contact the Futurae support at support@futurae.com.
- [Added] Added new methods in `FTRUtils` class for extracting information from a push notification payload

# Version 3.4.1-beta
2024-29-10
+ [Added] Method to retrieve notification data for arbitrary push notification
+ [Added] Support for universal links

# Version 3.1.7-beta
2024-09-05
+ [Changed] Privacy manifest file

# Version 3.1.6-beta
2024-25-04
This release focuses on resolving Apple's requirements for usage of private APIs.
- [Removed] Removed usage of APIs that track disk space. Those were not used by SDK, but the dependency of the SDK.
- [Updated] Added .xcprivacy declaration for UserPreferences API usage.

# Version 3.1.5-beta
2024-05-04
+ [Added] Trusted Session Binding for account migration

# Version 3.1.4-beta
2024-29-03
+ [Added] Flow binding implementation for enrollment

# Version 3.1.3-beta
2024-26-03
+ [Fixed] Reject push authentication issue

# Version 3.1.2-beta
2024-14-03
- [Added] Authentication type in dictionary data provided via notification delegate method `approveAuthenticationReceived`
- [Added] Expose SDK state to clients (not launched, launching, launched)
- [Changed] Ensure sequential execution of asynchronous operations in the SDK
- [Changed] Ensure public key is sent to backend before calling operations that depend on it
- [Changed] SDKLockConfigStatus is removed and no longer available.
- [Added] Add `FTRUtils` class with convenience methods to retrieve user id or session token from QR code or URI.
- [Changed] Internal improvements

# Version 3.1.1-beta
2024-12-02
- Fixed issue where account status does not include extra info.
- Internal changes related to Usernameless QR.

# Version 3.1.0-beta
2024-31-01
- Added `qrCodeScanRequested` method to the `FTRNotificationDelegate`. It is called when online QR authentication is requested and feature is enabled on the backend side.
- Added transparent approveInfo decryption, when it comes encrypted from the backend, in the `getAccountsStatus` and `getSessionInfo` methods. The feature needs to be enabled on the backend side.

# Version 3.0.1-beta
2024-05-01
- Removed version tag from the binary marketing version to comply with appstore requirements.

# Version 3.0.0-beta
2023-13-12
### Added
- **Swift Rewrite with Objective-C Compatibility**: Complete rewrite in Swift, offering modern language features while ensuring backward compatibility with Objective-C.
- **New Data Models**: Introduction of strongly typed data models, replacing loosely defined or dictionary-type data for enhanced type safety and predictability.
- **AsyncTask and AsyncTaskResult Classes**: New classes introduced to handle asynchronous operations in Swift, providing an efficient alternative to traditional callback patterns.
- **Enhanced Error Handling**: Robust and informative error handling system implemented. Errors can now be cast to `SDKBaseError` or its subclasses for detailed context and understanding.

### Changed
- **Method Names and Signatures**: Comprehensive update of method names and signatures to align with the Swift codebase. Developers should update their code to match these changes.
- **Consolidated Methods**: Optimization of similar methods, such as merging `approve` and `reject` into a single `replyAuth` method.

### Migration Guide
Users migrating from SDK v2.x.x can follow the detailed step-by-step guide provided. This guide covers acquiring the beta version of the SDK, refactoring application code, and adapting to the significant changes in this version. For more details, check the online iOS SDK guide notes for migrating from SDK v2.x.x to v3.x.x.

### Notes
This beta release marks a significant update, focusing on enhancing both performance and the development experience. It is recommended for users to migrate to this version to leverage the latest features and improvements. As this is a beta release, feedback and reports on any issues are highly encouraged to refine the SDK for its final release.

2023-02-11
In progress