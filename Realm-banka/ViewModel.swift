//
//  ViewModel.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 24.11.2022.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var amount: String = "0"
    
    @Published var bankaList: [BankaModel] = []
    
    var repository = Storage()
    
    init() {
        bankaList = repository.getBanks()
    }
    
    func calculate() {
        guard let numberAmount = Double(amount) else {
            return
        }
        
        let newList = bankaList.map { banka in
            var temp = banka
            temp.amount = numberAmount * (banka.percent / 100)
            return temp
        }
        
        repository.topUpBankas(list: newList) { [weak self] in
            if let bankas = self?.repository.getBanks() {
                self?.bankaList = bankas
            }
        }
        
//        first = "\(numberAmount * 0.5)"
//        second = "\(numberAmount * 0.1)"
//        third = "\(numberAmount * 0.1)"
//        fourth = "\(numberAmount * 0.1)"
//        fives = "\(numberAmount * 0.1)"
//        sixes = "\(numberAmount * 0.1)"
    }
}
