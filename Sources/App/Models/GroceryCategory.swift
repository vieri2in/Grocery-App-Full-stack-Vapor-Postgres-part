//
//  File.swift
//
//
//  Created by bin li on 7/28/23.
//

import Foundation
import Fluent
import Vapor
final class GroceryCategory: Model, Content, Validatable {
  static let schema: String = "grocery_categories"
  @ID(key: .id)
  var id: UUID?
  @Field(key: "title")
  var title: String
  @Field(key: "color_code")
  var colorCode: String
  @Parent(key: "user_id")
  var user: User
  init() {}
  init(id: UUID? = nil, title: String, colorCode: String, userId: UUID) {
    self.id = id
    self.title = title
    self.colorCode = colorCode
    self.$user.id = userId
  }
  static func validations(_ validations: inout Validations) {
    validations.add("title", as: String.self, is: !.empty,
                    customFailureDescription: "Title cannot be empty.")
    validations.add("colorCode", as: String.self, is: !.empty,
                    customFailureDescription: "Color code cannot be empty.")
  }
}
