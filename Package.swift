// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "CLMasterData",
    platforms: [.iOS(.v12), .macOS(.v10_14)],
    products: [
        .library(
            name: "CLMasterData",
            targets: ["CLMasterData"]),
    ],
    dependencies: [
        .package(url: "git@github.com:groue/GRDB.swift.git", from: "4.6.2")
    ],
    targets: [
        .target(
            name: "CLMasterData",
            dependencies: ["GRDB"]),
        .testTarget(
            name: "CLMasterDataTests",
            dependencies: ["CLMasterData"]),
    ]
)
