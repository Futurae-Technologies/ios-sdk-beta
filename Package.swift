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
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/v3.9.2/FuturaeKit-v3.9.2.xcframework.zip",
            checksum: "60d954f3317ca37892f753942729e2f513fe073b4a75df81fbc38941af97d7db"
        )
    ]
)