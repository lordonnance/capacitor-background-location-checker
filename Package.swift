// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorBackgroundLocationPermissionChecker",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorBackgroundLocationPermissionChecker",
            targets: ["LocationCheckerPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "LocationCheckerPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/LocationCheckerPlugin"),
        .testTarget(
            name: "LocationCheckerPluginTests",
            dependencies: ["LocationCheckerPlugin"],
            path: "ios/Tests/LocationCheckerPluginTests")
    ]
)