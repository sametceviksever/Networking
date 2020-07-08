//
//  Encodable+Dictionary.swift
//  Networking
//
//  Created by Samet Çeviksever on 7.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
  
  var data: Data? {
    return try? JSONEncoder().encode(self)
  }
}
