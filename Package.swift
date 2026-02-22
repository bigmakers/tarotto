// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "Tarotto",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Tarotto",
            targets: ["Tarotto"]
        ),
    ],
    targets: [
        .target(
            name: "Tarotto",
            path: "Tarotto"
        ),
    ]
)
