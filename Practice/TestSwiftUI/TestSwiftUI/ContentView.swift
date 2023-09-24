//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by 송영훈 on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "가영"
    var body: some View {
        VStack {
            Text("하잉! \(name)")
            
            Button {
                name = "까뇽"
            } label: {
                Text("온도 쉐낏")
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
