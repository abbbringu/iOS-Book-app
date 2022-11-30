//
//  DataService.swift
//  Amazing Books project final module 4
//
//  Created by Brian Nguyen on 2022-11-30.
//

import Foundation

class DataService {
    static func getData() -> [Book] {
        // Get file path
        let path = Bundle.main.path(forResource: "BookData", ofType: "json")
        
        // if path is empty, then return empty book array
        guard path != nil else {
            return [Book]()
        }
        // Get url from path
        let url = URL(fileURLWithPath: path!)
        
        do {
            // Try to put the url and convert the destination to a data object
            let data = try Data(contentsOf: url)
            
            // Declare a json decoder
            let decoder = JSONDecoder()
            
            do {
                // Attempting to decode the data in form of a list of books
                let values = try decoder.decode([Book].self, from: data)
                
                return values
            }
            catch {
                print("Couldn't decode the data")
                print(error)
            }
            
        }
        catch {
            print("error, Couldn't access the data")
            print(error)
        }
        // Return empty list if ay of the steps above don't pass
        return [Book]()
    }
}
