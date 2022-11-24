//
//  RealmBanka.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 24.11.2022.
//

import Foundation
import Realm
import RealmSwift

class RealmBanka: RealmSwiftObject {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var percent: Double
    @Persisted var amount: Double
}
