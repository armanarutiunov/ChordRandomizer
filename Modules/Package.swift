// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    products: [
        .library(name: "MusicTheory",
                 targets: ["MusicTheory"]),
        .library(name: "Utilities",
                 targets: ["Utilities"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "MusicTheory",
                dependencies: ["Utilities"]),
        .target(name: "Utilities",
                dependencies: []),
        .testTarget(name: "MusicTheoryTests",
                    dependencies: ["MusicTheory"])
    ]
)
