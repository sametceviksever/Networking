
//
//  GetNetworkOperation.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

protocol GetNetworkOperation: NetworkOperation { }

extension GetNetworkOperation {
  var methodType: MethodType { get { return .get } set { } }
  
  func prepareRequest<T>(with object: T) -> URLRequest? where T : Requestable {
    var urlStr = urlString
    if let dict: [String: Any] = object.body?.dictionary {
      let objects: [String] = dict.reduce([]) { (arr, keyValue) -> [String] in
        var array = arr
        array.append("\(keyValue.key)=\(keyValue.value)")
        
        return array
      }
      let suffix: String = urlStr.last == "/" ? "?" : "/?"
      urlStr = urlStr + suffix + objects.joined(separator: "&")
    }
    
    guard let url: URL = URL(string: urlStr) else {
      return nil
    }
    var req = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeOut)
    req.httpMethod = methodType.rawValue
    req.allHTTPHeaderFields = headers
    if contentType != .none{
      req.addValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
    }
    
    return req
  }
}
