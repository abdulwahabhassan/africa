//
//  VideoModel.swift
//  Africa
//
//  Created by Hassan Abdulwahab on 06/06/2022.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
