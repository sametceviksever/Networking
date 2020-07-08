//
//  iTunesSearchResponseModel.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

public struct ITunesModel: Codable {
  let resultCount: Int
  var results: [Media]
}

public struct Media: Codable {
  let previewUrl: String?
  let artworkUrl60: String?
  let artworkUrl30: String?
  let artworkUrl100: String?
  let releaseDate: String?
  let trackName: String?
  
  private enum CodingKeys: String, CodingKey {
    case previewUrl
    case artworkUrl30
    case artworkUrl60
    case artworkUrl100
    case releaseDate
    case trackName
  }
}
