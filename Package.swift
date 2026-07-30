// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "UniversalPerformanceKit",

    platforms: [
        .iOS(.v15)
    ],

    products: [
        .library(
            name: "UniversalPerformanceKit",
            targets: [
                "UniversalPerformanceKit"
            ]
        )
    ],

    targets: [
        .target(
            name: "UniversalPerformanceKit",
            path: "Source",
            publicHeadersPath: "include"
        )
    ]
)
