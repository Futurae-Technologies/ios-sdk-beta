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
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/3.9.0/FuturaeKit-v3.9.0.xcframework.zip",
            checksum: "02925a9e05d0cf7704d393609b970f975b9d1808789eb965fcf8b06b47765efd"
        )
    ]
)