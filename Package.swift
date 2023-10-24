// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CombineLocationManager",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "CombineLocationManager", type: .static, targets: ["CombineLocationManager"]),
    ],
    dependencies: [
        // .package(url: "https://github.com/usami-k/SwiftLintPlugin", branch: "main")
    ],
    targets: [
        .target(
            name: "CombineLocationManager",
            dependencies: [],
            plugins: [
                // .plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin")
            ]
        ),
        .testTarget(
            name: "CombineLocationManagerTests",
            dependencies: ["CombineLocationManager"]),
    ]
)
