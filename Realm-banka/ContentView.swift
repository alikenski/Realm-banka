//
//  ContentView.swift
//  Realm-banka
//
//  Created by Alisher Aidarkhan on 24.11.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = .init()
    
    var body: some View {
        VStack {
            TextField("Введите сумму", text: $viewModel.amount)
                .keyboardType(.numberPad)
                .padding(4)
                .border(.black)
            Spacer()
            ForEach(viewModel.bankaList) { banka in
                VStack {
                    Text("\(banka.title) - \(Int(banka.percent))%")
                        .font(Font.system(size: 18).bold())
                    Text("\(Int(banka.amount))")
                        .font(Font.system(size: 16))
                    if let doubledAmount = Double(viewModel.amount) {
                        let plusAmount = doubledAmount * (banka.percent / 100)
                        Text("+\(plusAmount)")
                            .font(Font.system(size: 12))
                    }
                    
                }
                .padding()
                .border(.black)
            }
            
            Spacer()
            Button("Save") {
                viewModel.calculate()
            }
            Spacer()
        }
        .padding()
    }
}
