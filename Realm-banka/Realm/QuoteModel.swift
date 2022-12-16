//
//  QuoteModel.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 16.12.2022.
//

import Foundation

struct QuoteModel: Codable, Hashable {
//    var id: String
    let anime: String
    let character: String
    let quote: String
    
    init(anime: String, character: String, quote: String) {
//        self.id = UUID().uuidString
        self.anime = anime
        self.character = character
        self.quote = quote
    }
}
