//
//  ContentView.swift
//  HelloWorld
//
//  Created by 송영훈 on 2023/06/29.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        // MARK: - 1.BASIC
        // AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. SCALE
        // AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // MARK: - 3. PLACEHOLDER
        AsyncImage(url: URL(string: imageURL)) { image in
            image
        } placeholder: {
            Image(systemName: "photo.circle.fill")
        }
        .padding(40)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
