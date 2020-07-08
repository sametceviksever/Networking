//
//  iTunesSearchRequestModel.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

struct ITunesSearchRequestModel: Encodable {
  let term: String
  let limit: Int
  let media: String?
  
  init(term: String,
       limit: Int = 100,
       media: String?) {
    self.term = term.replacingOccurrences(of: " ", with: "+")
    self.limit = limit
    self.media = media
  }
}
