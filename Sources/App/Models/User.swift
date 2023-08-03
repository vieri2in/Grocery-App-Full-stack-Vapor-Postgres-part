//
//  File.swift
//  
//
//  Created by bin li on 7/26/23.
//

import Foundation
import Fluent
import Vapor
final class User: Model, Content, Validatable{
  static func validations(_ validations: inout Vapor.Validations) {
    validations.add("username", as: String.self, is: !.empty, customFailureDescription: "Username cannot be empty.")
    validations.add("password", as: String.self, is: !.empty, customFailureDescription: "Password cannot be empty.")
    validations.add("password", as: String.self, is: .count(6...10), customFailureDescription: "Password must be between 6 and 10 characters long.")
    
  }
  
  static let schema = "users"
  @ID(key: .id)
  var id: UUID?
  @Field(key: "username")
  var username: String
  @Field(key: "password")
  var password: String
  
  init() {}
  init(id: UUID? = nil, username: String, password: String) {
    self.id = id
    self.username = username
    self.password = password
  }
}
