//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Hassan Abdulwahab on 05/06/2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T { //generic function
        
        //the guard keyword is used to throw a fatal error which causes the app to crash when a url for the resource with the specified name
        //could not be found in the app bundle
        
        //find the json resource in the app bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //create a property for the data

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        //create json decoder
        let decoder = JSONDecoder()
        
        //create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from Bundle")
        }
        //return the decoded json
        return loaded
    }
}
