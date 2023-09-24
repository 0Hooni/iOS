//
//  ContentView.swift
//  iOS Memo
//
//  Created by 송영훈 on 2023/08/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Label("메모", systemImage: "folder")
                    Label("최근 삭제된 항목", systemImage: "trash")
                } header: {
                    Text("iCloud")
                }
                Section {
                    Text("태그 목록")
                } header: {
                    Text("태그")
                }

            }
            .navigationTitle(Text("폴더"))
            .toolbar {
                Button("편집") {
                    print("편집")
                }
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
