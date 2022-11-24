//
//  BankaModel.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 25.11.2022.
//

import Foundation

struct BankaModel: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    var amount: Double
    let percent: Double
}
