//
//  NetworkError.swift
//  Networking
//
//  Created by Samet Çeviksever on 8.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
  case urlError
  case notfound
  case `default`
  case custom(Error)
  case http(Int)
  
  public var localizedDescription: String {
    switch self {
    case .urlError:
      return "URL is wrong"
    case .notfound:
      return "Not Found"
    case .custom(let err):
      return err.localizedDescription
    case .http(let errorCode):
      return "\(errorCode)"
    case .default:
      return "Somethings wrong"
    }
  }
  
  public var httpErrorCode: Int? {
    switch self {
    case .http(let code):
      return code
    default:
      return nil
    }
  }
  
  public var customError: Error? {
    switch self {
    case .custom(let error):
      return error
    default:
      return nil
    }
  }
}
