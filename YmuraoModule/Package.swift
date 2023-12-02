// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YmuraoModule",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: .ymuraoModule,
            targets: [.ymuraoModule]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: .ymuraoModule,
            dependencies: [
                .asset,
                .views
            ]
        ),
        .target(
            name: .asset
        ),
        .target(
            name: .views,
            dependencies: [
                .asset
            ]
        )
    ]
)

extension String {
    static let ymuraoModule = "YmuraoModule"
    static let views = "Views"
    static let asset = "Asset"
}

extension Target.Dependency {
    static let views = Self(stringLiteral: .views)
    static let asset = Self(stringLiteral: .asset)
}
