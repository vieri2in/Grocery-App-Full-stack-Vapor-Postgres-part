//
//  File.swift
//  
//
//  Created by bin li on 7/26/23.
//

import Foundation
import Vapor
import Fluent
import GroceryAppSharedDTO
class UserController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    // /api/register
    // /api/login
    let api = routes.grouped("api")
    // /api/register POST
    api.post("register", use: register)
    // /api/login POST
    api.post("login", use: login)
  }
  func register(req: Request) async throws -> RegisterResponseDTO {
    try User.validate(content: req)
    let user = try req.content.decode(User.self)
    if let _ = try await User.query(on: req.db)
      .filter(\.$username == user.username)
      .first() {
      throw Abort(.conflict, reason: "Username is already taken.")
    }
    user.password = try await req.password.async.hash(user.password)
    try await user.save(on: req.db)
    return RegisterResponseDTO(error: false)
  }
  func login(req: Request) async throws -> LoginResponseDTO {
    let user = try req.content.decode(User.self)
    guard let existingUser = try await User.query(on: req.db)
      .filter(\.$username == user.username)
      .first() else {
      return LoginResponseDTO(error: true, reason: "Username is not found.")
    }
    let result = try await req.password.async.verify(user.password, created: existingUser.password)
    if !result {
      return LoginResponseDTO(error: true, reason: "Password is incorrect.")
    }
    let authPayload = try AuthPayload(expiration: .init(value: .distantFuture),
                                      userId: existingUser.requireID())
    return try LoginResponseDTO(error: false, token: req.jwt.sign(authPayload), userId: existingUser.requireID())
  }
}
