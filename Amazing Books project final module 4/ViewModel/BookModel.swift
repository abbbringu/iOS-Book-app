//
//  BookModel.swift
//  Amazing Books project final module 4
//
//  Created by Brian Nguyen on 2022-11-30.
//

import Foundation

class BookModel: ObservableObject {
    @Published var books = [Book]()
    
    init() {
        self.books = DataService.getData()
        print("\(books.count)")
    }
    func toggleStar(index:Int){
        books[index].isFavourite.toggle()
    }
}
