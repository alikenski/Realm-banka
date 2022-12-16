//
//  Repository.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 24.11.2022.
//

import Foundation

protocol Repository {
    func topUpBankas(list: [BankaModel], completion: (() -> Void)?)
    func getBanks() -> [BankaModel]
    func addQuotes(list: [QuoteModel], completion: (() -> Void)?)
    func getQuotes() -> [QuoteModel]
    func deleteQuotes()
}
