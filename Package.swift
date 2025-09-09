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
            checksum: "b579052866ebb695cf2b8996ea80850dc93d1b48b01698577b109ab70d00baf8"
        )
    ]
)