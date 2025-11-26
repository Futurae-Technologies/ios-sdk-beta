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
            checksum: "5f25d18e2d3039130514cc24b9ce4c7d58010d4e4598f77b6a83eed0c135116e"
        )
    ]
)