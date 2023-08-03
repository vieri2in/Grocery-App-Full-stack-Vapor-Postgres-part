//
//  File.swift
//  
//
//  Created by bin li on 7/28/23.
//

import Foundation
import GroceryAppSharedDTO
import Vapor
extension GroceryCategoryRequestDTO: Content {
}
extension GroceryCategoryResponseDTO: Content {
  init?(_ groceryCategory: GroceryCategory) {
    guard let id = groceryCategory.id else { return nil }
    self.init(id: id, title: groceryCategory.title, colorCode: groceryCategory.colorCode)
  }
  
}
