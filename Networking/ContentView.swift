//
//  ContentView.swift
//  Networking
//
//  Created by Samet Çeviksever on 7.07.2020.
//  Copyright © 2020 Samet Çeviksever. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Button(action: {
        self.call()
      }) {
        Text("Call")
      }
    }
  
  func call() {
    let req = ITunesSearchRequestModel(term: "harr", limit: 100, media: nil)
    let operation = iTunesSearchOperation(body: req) { (result) in
      guard case .success(let object) = result else {
        return
      }
      
      print(object)
    }
    
    iTunesNetworkOperation(urlString: "https://itunes.apple.com/search").execute(operation: operation)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
