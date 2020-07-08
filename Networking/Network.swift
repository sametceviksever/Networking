//
//  Network.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

public final class Network: NetworkAgent {
  static var shared: Network = Network()
  
  func execute(request: URLRequest, then: ((Response) -> Void)?) {
    URLSession.shared.dataTask(with: request) {(data, urlResponse, error) in
      DispatchQueue.main.async {
        then?((data, urlResponse, error))
      }
      }.resume()
  }
}
