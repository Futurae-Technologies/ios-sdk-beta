// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FuturaeKit",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "FuturaeKit", targets: ["FuturaeKit"]),
    ],
    targets: [
        .binaryTarget(
            name: "FuturaeKit",
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/v3.8.0-beta/FuturaeKit-v3.8.0.xcframework.zip",
            checksum: "272c574e938c7e44e284b32fdf10a8c065af93c6271194214f271709a62b2edb"
        )
    ]
)