// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWDetectDevice",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWDetectDevice", targets: ["WWDetectDevice"]),
    ],
    targets: [
        .target(name: "WWDetectDevice", resources: [.copy("JSON")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
