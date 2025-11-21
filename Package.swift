// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FuturaeKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "FuturaeKit", targets: ["FuturaeKit"]),
    ],
    targets: [
        .binaryTarget(
            name: "FuturaeKit",
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/v3.9.1/FuturaeKit-v3.9.1.xcframework.zip",
            checksum: "514bdf1e76647d9e43ff4a98e5b3c251ff295a0e31c6a44bead0aefea7adc61a"
        )
    ]
)