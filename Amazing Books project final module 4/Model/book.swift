//
//  book.swift
//  Amazing Books project final module 4
//
//  Created by Brian Nguyen on 2022-11-30.
//

import Foundation

struct Book : Identifiable, Decodable {
    var id:Int
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var content:[String]
}
