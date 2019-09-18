// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Viperit",
    platforms: [.iOS("11.0")],
    products: [
        .library(name: "Viperit", targets: ["Viperit"])
    ],
    targets: [
        .target(name: "Viperit", path: "Viperit"),
        .testTarget(name: "ViperitTests", dependencies: ["Viperit"], path: "ViperitTests")
    ]
)
