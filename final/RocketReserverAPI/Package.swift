// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "RocketReserverAPI",
  platforms: [
    .iOS(.v16),
    .macOS(.v13),
    .tvOS(.v16),
    .watchOS(.v9),
  ],
  products: [
    .library(name: "RocketReserverAPI", targets: ["RocketReserverAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", .upToNextMajor(from: .init(1, 4, 0 )))
  ],
  targets: [
    .target(
      name: "RocketReserverAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ]
)
