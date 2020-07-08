//
//  iTunesNetworkOperation.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

struct iTunesNetworkOperation: GetNetworkOperation {
  var urlString: String
  var agent: NetworkAgent = Network.shared
  
  func handle<T>(response: (data: Data?, urlResponse: URLResponse?, error: Error?), for operation: T) where T : Responsable {
    if let error = response.error {
      let reqError = NetworkError.custom(error)
      operation.handler?(.failure(reqError as! T.ErrorType))
      return
    }
    
    guard let data = response.data else {
      let defaultError = NetworkError.default
      operation.handler?(.failure(defaultError as! T.ErrorType))
      return
    }
    do {
      let result: T.ResponseType = try data.decode()
      operation.handler?(.success(result))
    } catch let error {
      operation.handler?(.failure(NetworkError.custom(error) as! T.ErrorType))
    }
  }
}

struct iTunesSearchOperation: Operatable {
  typealias RequestBody = ITunesSearchRequestModel
  typealias ResponseType = ITunesModel
  typealias ErrorType = Error
  
  var body: ITunesSearchRequestModel?
  var handler: ResultHandler?
}
