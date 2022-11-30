//
//  Card.swift
//  Amazing Books project final module 4
//
//  Created by Brian Nguyen on 2022-11-30.
//

import SwiftUI

struct Card: View {
    @EnvironmentObject var bookModel:BookModel
    @State var index:Int
    var body: some View {
        // Base of a card
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            // Content on the Card
            VStack(alignment: .center){
                HStack {
                    VStack(alignment: .leading){
                        // Books title
                        Text(bookModel.books[index].title)
                            .font(.title2)
                            .fontWeight(.bold)
                        // Books author
                        Text(bookModel.books[index].author)
                            .italic()
                    }
                    Spacer()
                    if bookModel.books[index].isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.yellow)
                            .frame(width: 30)
                    }
                }
                // Books cover, making us of the id
                Image("cover\(index + 1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

            }
            .padding()
        }
        .frame(width: 350, height: 500)
        .cornerRadius(15)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 10, x: -5, y: 5)

    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        // Temp values for previews
        Card(index: 0)
            .environmentObject(BookModel())
    }
}
