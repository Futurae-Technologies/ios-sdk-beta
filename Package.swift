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
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/v3.9.3/FuturaeKit-v3.9.3.xcframework.zip",
            checksum: "916be2d481baebac7fb84d31191748c2ecc6a7952eb07822bc6f6cff9120af70"
        )
    ]
)