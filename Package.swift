// swift-tools-version:5.3
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
                .process("Resources")
            ]),
        .testTarget(
            name: "cryptotokens-swiftTests",
            dependencies: ["cryptotokens-swift"]),
    ]
)
    