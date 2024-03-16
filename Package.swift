// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "RedditKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
    ],
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
        .executableTarget(name: String("RedditCLI"), dependencies: ["RedditKit"]),
        .testTarget(
            name: "RedditKitTests",
            dependencies: ["RedditKit"]
        ),
    ]
)
