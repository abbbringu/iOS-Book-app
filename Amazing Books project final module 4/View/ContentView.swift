//
//  ContentView.swift
//  Amazing Books project final module 4
//
//  Created by Brian Nguyen on 2022-11-30.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model:BookModel
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(0..<model.books.count){ index in
                        NavigationLink (
                            destination: DetailedView(index: index),
                            label: {
                                Card(index: index)
                                    .padding()
                            })
                        .foregroundColor(.black)
                    }
                }
                .navigationTitle("My Library")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BookModel())
    }
}
