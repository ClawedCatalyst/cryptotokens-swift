// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "cryptotokens-swift",
    products: [
        .library(
            name: "cryptotokens-swift",
            targets: ["cryptotokens-swift"]),
    ],
    targets: [
        .target(
            name: "cryptotokens-swift",
            resources: [
                .process("Resources/branded"),
                .process("Resources/mono")
            ]),
        .testTarget(
            name: "cryptotokens-swiftTests",
            dependencies: ["cryptotokens-swift"]),
    ]
)