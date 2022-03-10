//
//  ContentView.swift
//  Movie
//
//  Created by 윤상진 on 2022/03/09.
//

import SwiftUI

struct ContentView: View {
    fileprivate func extractedFunc() -> some View {
        return Text("Hello, world!")
            .padding()
    }
    
    var body: some View {
        extractedFunc()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
