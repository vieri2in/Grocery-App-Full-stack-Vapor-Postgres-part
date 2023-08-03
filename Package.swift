// swift-tools-version: 5.8
import PackageDescription

let package = Package(
  name: "grocery-app-server",
  platforms: [
    .macOS(.v13)
  ],
  dependencies: [
    // 💧 A server-side Swift web framework.
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/jwt.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0"),
    .package(url: "https://github.com/vieri2in/GroceryAppSharedDTO.git", branch: "main")
    
  ],
  targets: [
    .executableTarget(
      name: "App",
      dependencies: [
        .product(name: "Vapor", package: "vapor"),
        .product(name: "Fluent", package: "fluent"),
        .product(name: "JWT", package: "jwt"),
        .product(name: "GroceryAppSharedDTO", package: "GroceryAppSharedDTO"),
        .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver")
      ]
    ),
    .testTarget(name: "AppTests", dependencies: [
      .target(name: "App"),
      .product(name: "XCTVapor", package: "vapor"),
    ])
  ]
)
