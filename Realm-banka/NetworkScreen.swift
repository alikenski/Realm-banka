//
//  NetworkScreen.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 16.12.2022.
//

import SwiftUI

struct NetworkScreen: View {
    @StateObject var viewModel: NetworkViewModel = .init()
    
    var body: some View {
        VStack {
            Text(viewModel.loadFrom)
            List {
                ForEach(viewModel.quotes, id: \.self.quote) { quote in
                    VStack(alignment: .leading) {
                        Text(quote.anime)
                            .font(Font.system(size: 12, weight: .bold))
                        Text(quote.character)
                            .font(Font.system(size: 14, weight: .black))
                        Text(quote.quote)
                            .font(Font.system(size: 12, weight: .regular))
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchQuotes()
        }
    }
    
}
