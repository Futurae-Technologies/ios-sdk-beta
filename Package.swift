// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FuturaeKit",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "FuturaeKit", targets: ["FuturaeKit", "FuturaeKitUmbrella"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stephencelis/SQLite.swift.git", .upToNextMajor(from: "0.14.1")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.6.0")),
    ],
    targets: [
        .binaryTarget(
            name: "FuturaeKit",
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/v3.1.6-beta/FuturaeKit-v3.1.6.xcframework.zip",
            checksum: "2ed101b7a493c0cee2188d69c0117d4339f831c6aa9e21306e56ec7648a8071c"
        ),
        .target(
            name: "FuturaeKitUmbrella",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "SQLite", package: "SQLite.swift"),
            ]
        )
    ]
)
