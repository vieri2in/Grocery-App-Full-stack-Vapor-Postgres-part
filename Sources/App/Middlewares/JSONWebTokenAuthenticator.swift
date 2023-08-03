//
//  File.swift
//  
//
//  Created by bin li on 8/1/23.
//

import Foundation
import Vapor
struct JSONWebTokenAuthenticator: AsyncRequestAuthenticator {
  func authenticate(request: Vapor.Request) async throws {
    try request.jwt.verify(as: AuthPayload.self)
  }
  
  
}
