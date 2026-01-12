// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "apple_tutorial",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        // An xtool project should contain exactly one library product,
        // representing the main app.
        .library(
            name: "apple_tutorial",
            targets: ["apple_tutorial"]
        )
    ],
    targets: [
        .target(
            name: "apple_tutorial",
            resources: [.process("Assets.xcassets")]
        )
    ]
)
