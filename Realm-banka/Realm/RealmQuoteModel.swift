//
//  RealmQuoteModel.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 16.12.2022.
//

import Foundation

import Realm
import RealmSwift

class RealmQuoteModel: RealmSwiftObject {
    @Persisted(primaryKey: true) var id: String
    @Persisted var anime: String
    @Persisted var character: String
    @Persisted var quote: String
}
