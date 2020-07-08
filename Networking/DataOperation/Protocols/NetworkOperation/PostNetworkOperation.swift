//
//  PostNetworkOperation.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

protocol PostNetworkOperation: NetworkOperation { }

extension PostNetworkOperation {
  var methodType: MethodType { return .post }
  
  func prepareRequest<T>(with object: T) -> URLRequest? where T : Requestable {
    guard let url: URL = URL(string: urlString) else {
      return nil
    }
    
    var req: URLRequest = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeOut)
    req.httpBody = object.body?.data
    req.httpMethod = methodType.rawValue
    req.allHTTPHeaderFields = headers
    
    return req
  }
}
