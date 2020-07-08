//
//  NetworkOperation.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

protocol NetworkOperation {
  var methodType: MethodType { get set }
  var contentType: ContentType { get set }
  var timeOut: TimeInterval { get set }
  var cachePolicy: URLRequest.CachePolicy {get}
  var urlString: String { get set }
  var headers: [String: String] { get set }
  var agent: NetworkAgent { get set }
  
  func execute<T: Operatable>(operation: T)
  func prepareRequest<T: Requestable>(with object: T) -> URLRequest?
  func handle<T: Responsable>(response: NetworkAgent.Response, for operation: T)
}

extension NetworkOperation {
  var cachePolicy: URLRequest.CachePolicy {return .useProtocolCachePolicy}
  var timeOut: TimeInterval { get { return 60 } set { } }
  var contentType: ContentType { get { return .json } set { } }
  var headers: [String: String] { get { return [:] } set { } }
  
  func execute<T: Operatable>(operation: T) {
    guard let request: URLRequest = prepareRequest(with: operation) else {
      print("URL Request cannot produce")
      return
    }
    
    agent.execute(request: request) { (response) in
      self.handle(response: response, for: operation)
    }
  }
}

protocol NetworkAgent: AnyObject {
  typealias Response = (data: Data?, urlResponse: URLResponse?, error: Error?)
  
  func execute(request: URLRequest, then: ((Response) -> Void)?)
}
