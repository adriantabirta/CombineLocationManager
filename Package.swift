// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CombineLocationManager",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "CombineLocationManager", type: .static, targets: ["CombineLocationManager"]),
        .library(name: "CombineLocationManagerWithGenerics", type: .static, targets: ["CombineLocationManagerWithGenerics"]),
    ],
    dependencies: [
        // .package(url: "https://github.com/usami-k/SwiftLintPlugin", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CombineLocationManager",
            dependencies: [],
            plugins: [
                // .plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin")
            ]
        ),
        .target(
            name: "CombineLocationManagerWithGenerics",
            dependencies: [],
            plugins: [
                // .plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin")
            ]
        ),
        .testTarget(
            name: "CombineLocationManagerTests",
            dependencies: ["CombineLocationManager"]),
        .testTarget(
            name: "CombineLocationManagerWithGenericsTests",
            dependencies: ["CombineLocationManagerWithGenerics"]),
    ]
)
