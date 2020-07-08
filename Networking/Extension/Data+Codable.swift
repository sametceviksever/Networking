//
//  Data+Codable.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

public extension Data {
  func decode<T>() throws -> T where T: Decodable {
    let decoder = JSONDecoder()
    let result = try decoder.decode(T.self, from: self)
    return result
  }
}
