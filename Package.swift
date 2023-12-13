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
            url: "https://github.com/Futurae-Technologies/ios-sdk-beta/releases/download/v3.0.0-beta/FuturaeKit-v3.0.0-beta.xcframework.zip",
            checksum: "c0a08e17c5d5c142a94772e885d141e3008182cd15dcd3eec286e34dcce2cf6e"
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
