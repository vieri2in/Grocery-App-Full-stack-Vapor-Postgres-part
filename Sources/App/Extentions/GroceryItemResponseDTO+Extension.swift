//
//  File.swift
//
//
//  Created by bin li on 7/31/23.
//

import Foundation
import Vapor
import GroceryAppSharedDTO
extension GroceryItemResponseDTO: Content {
  init?(_ groceryItem: GroceryItem) {
    guard let groceryItemId = groceryItem.id else { return nil }
    self.init(id: groceryItemId,
              title: groceryItem.title,
              price: groceryItem.price,
              quantity: groceryItem.quantity)
  }
}
