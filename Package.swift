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
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/v3.8.1-beta/FuturaeKit-v3.8.1.xcframework.zip",
            checksum: "82b34258d82e3330585db3eb9ea6c6105e1d682d8315749b1cd90aac2272daa5"
        )
    ]
)