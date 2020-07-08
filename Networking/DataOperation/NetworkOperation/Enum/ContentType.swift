//
//  ContentType.swift
//  Networking
//
//  Created by Samet Çeviksever on 7.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import Foundation

public enum ContentType:String{
    case json = "application/json; charset=utf-8"
    case urlencoded = "application/x-www-form-urlencoded"
    case none = ""
}
