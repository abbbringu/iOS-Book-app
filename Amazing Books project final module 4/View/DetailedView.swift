//
//  DetailedView.swift
//  Amazing Books project final module 4
//
//  Created by Brian Nguyen on 2022-11-30.
//

import SwiftUI

struct DetailedView: View {
    @EnvironmentObject var bookModel:BookModel
    @State var index:Int
    @State var star:String = "star"
    
    var body: some View {
        VStack(spacing: 30){
            NavigationLink(destination: {
                readingView(index: index)
            }, label: {
                VStack{
                    Text("Read now!")
                        .font(.title)
                        .fontWeight(.regular)
                    Image("cover\(index + 1)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                }
            })
            .foregroundColor(.black)
            VStack{
                Text("Mark for later")
                Button {
                    bookModel.toggleStar(index: index)
                    getStar()
                } label: {
                    Image(systemName: star)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .foregroundColor(.yellow)
                        .onAppear {
                            getStar()
                        }
                }
                

            }
            VStack{
                Text("Rate \(bookModel.books[index].title)")
                    .bold()
                Picker("BookRating", selection: $bookModel.books[index].rating) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 35)
            }
        }
        .navigationTitle(bookModel.books[index].title)

    }
    func getStar(){
        star = bookModel.books[index].isFavourite ? "star.fill": "star"
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(index: 0)
            .environmentObject(BookModel())
    }
}
