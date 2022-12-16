//
//  NetworkViewModel.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 16.12.2022.
//

import Foundation
import Alamofire

class NetworkViewModel: ObservableObject {
    var repository = Storage()
    @Published var loadFrom = "Cache"
    @Published var quotes: [QuoteModel] = []
    
    func fetchQuotes() {
//        repository.deleteQuotes()
        if repository.getQuotes().isEmpty {
            loadFrom = "Network"
            AF.request("https://animechan.vercel.app/api/quotes/anime?title=Naruto&page=1")
                .responseDecodable(of: [QuoteModel].self) { [weak self] response in
                    print("###: response", response.error?.errorDescription)
                    if let newQuotes = response.value {
                        self?.quotes = newQuotes
                        self?.repository.addQuotes(list: newQuotes, completion: nil)
                    }
                }
        } else {
            loadFrom = "Cache"
            quotes = repository.getQuotes()
        }
    }
}
