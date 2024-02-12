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