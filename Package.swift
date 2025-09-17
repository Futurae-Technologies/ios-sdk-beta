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
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/v3.8.2-beta/FuturaeKit-v3.8.2.xcframework.zip",
            checksum: "9c574cfc5183f40276006532bf7f0c321a2f9eb529937453627e6b5d0c1aaa2a"
        )
    ]
)