// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "RedditKit",
    products: [
        .library(
            name: "RedditKit",
            targets: ["RedditKit"]
        )
    ],
    targets: [
        .target(
            name: "RedditKit",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "RedditKitTests",
            dependencies: ["RedditKit"]
        ),
    ]
)
