// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YmuraoModule",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: .ymuraoModule,
            targets: [.ymuraoModule]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0")
    ],
    targets: [
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
                .asset,
                .product(name: "Algorithms", package: "swift-algorithms")
            ]
        )
    ]
)

extension String {
    static let ymuraoModule = "YmuraoModule"
    static let views = "Views"
    static let asset = "Asset"
    // external package
    static let swiftAlgorithms = "swift-algorithms"
}

extension Target.Dependency {
    static let views = Self(stringLiteral: .views)
    static let asset = Self(stringLiteral: .asset)
    // external package
    static let swiftAlgorithms = Self(stringLiteral: .swiftAlgorithms)
}
