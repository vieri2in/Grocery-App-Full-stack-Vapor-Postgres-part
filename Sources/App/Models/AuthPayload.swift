//
//  File.swift
//  
//
//  Created by bin li on 7/27/23.
//

import Foundation
import JWT
struct AuthPayload: JWTPayload {
  typealias Payload = AuthPayload
//  var subject: SubjectClaim
  var expiration: ExpirationClaim
  var userId: UUID
  enum CodingKeys: String, CodingKey {
//    case subject = "sub"
    case expiration = "exp"
    case userId = "uid"
  }
  func verify(using signer: JWTKit.JWTSigner) throws {
    try self.expiration.verifyNotExpired()
  }
  
  
}
