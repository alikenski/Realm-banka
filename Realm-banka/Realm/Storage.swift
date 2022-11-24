//
//  Storage.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 24.11.2022.
//

import Foundation
import Realm
import RealmSwift

class Storage {
    private var instance: Realm
    private let defaultBankas = [
        BankaModel(id: 1, title: "Необходимое", amount: 0, percent: 55),
        BankaModel(id: 2, title: "Развлечение", amount: 0, percent: 10),
        BankaModel(id: 3, title: "Инвестиция", amount: 0, percent: 10),
        BankaModel(id: 4, title: "Образование", amount: 0, percent: 10),
        BankaModel(id: 5, title: "Резерв", amount: 0, percent: 10),
        BankaModel(id: 6, title: "Благотворительность", amount: 0, percent: 5)
    ]
    
    init() {
        let realmUrl = try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        .appendingPathComponent("Banka.realm")
        
        var realmConfig = Realm.Configuration()
        realmConfig.fileURL = realmUrl

        instance = try! Realm(configuration: realmConfig)
        
        checkBankas()
    }
    
    private func checkBankas() {
        let result = instance.objects(RealmBanka.self)
        
        if result.isEmpty {
            defaultBankas.forEach({ banka in
                
                let realmBanka = RealmBanka()
                realmBanka.id = banka.id
                realmBanka.title = banka.title
                realmBanka.percent = banka.percent
                realmBanka.amount = banka.amount
                
                DispatchQueue.main.async {
                    do {
                        try self.instance.write {
                            self.instance.add(realmBanka)
                        }
                    } catch {
                        print("Error during realm add")
                    }
                }
            })
        }
    }
}

extension Storage: Repository {
    func topUpBankas(list: [BankaModel], completion: (() -> Void)? = nil) {
        list.forEach { banka in
            let result = instance.objects(RealmBanka.self)
                .filter("id == \(banka.id)")
            
            do {
                try instance.write({
                    let foundBanka = result.first!
                    foundBanka.setValue(foundBanka.amount + banka.amount, forKey: "amount")
                    instance.add(foundBanka, update: .modified)
                })
            } catch {
                print("Error during realm modify")
            }
        }
        completion?()
    }
    
    func getBanks() -> [BankaModel] {
        let result = instance.objects(RealmBanka.self)
        var converted: [BankaModel] = []
        
        converted = result.map { current in
            BankaModel(id: current.id,
                       title: current.title,
                       amount: current.amount,
                       percent: current.percent)
        }
        
        return converted
    }
}
