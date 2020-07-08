//
//  Operatable.swift
//  Networking
//
//  Created by Samet Çeviksever on 7.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

typealias Operatable = Requestable & Responsable

protocol Requestable {
  associatedtype RequestBody: Encodable
  
  var body: RequestBody? { get set }
}

protocol Responsable {
  associatedtype ResponseType: Decodable
  associatedtype ErrorType: Error
  
  typealias ResultHandler = (Result<ResponseType, ErrorType>?) -> Void
  
  var handler: ResultHandler? { get set }
}
