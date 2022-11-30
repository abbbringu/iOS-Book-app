//
//  readingView.swift
//  Amazing Books project final module 4
//
//  Created by Brian Nguyen on 2022-11-30.
//

import SwiftUI

struct readingView: View {
    @State var index:Int
    @EnvironmentObject var bookModel:BookModel
    var body: some View {
        VStack {
            TabView(selection: $bookModel.books[index].currentPage) {
                ForEach(0..<bookModel.books[index].content.count) { i in
                    VStack {
                        Text(bookModel.books[index].content[i])
                        Spacer()
                        Text("\(i + 1)")
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .tag(i)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }
    }
}

struct readingView_Previews: PreviewProvider {
    static var previews: some View {
        readingView(index: 0)
            .environmentObject(BookModel())
    }
}
