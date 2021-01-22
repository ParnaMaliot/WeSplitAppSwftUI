//
//  ContentView.swift
//  WeSplit
//
//  Created by Igor Parnadziev on 9/13/20.
//  Copyright © 2020 Maliot. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var numberOfPeople = ""
    @State private var tipsPercentage = 2

    var totalAmountPlusTip: Double {
        let tipSelection = Double(tipsPercentages[tipsPercentage])
        let totalAmount = Double(amount) ?? 0
        let tipValue = totalAmount / 100 * tipSelection
        let grandTotal = totalAmount + tipValue
        
        return grandTotal
    }
    
    let tipsPercentages = [5, 10, 15, 20, 0]
    
    var tipCalculator: Double {
        let people = Double(Int(numberOfPeople) ?? 0 + 2)
        let tipSelection = Double(tipsPercentages[tipsPercentage])
        let totalAmount = Double(amount) ?? 0
        
        let tipValue = totalAmount / 100 * tipSelection
        let grandTotal = totalAmount + tipValue
        let amountPerPerson = grandTotal / people
        
        return amountPerPerson
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    Section(header: Text("Select the tip percentage")) {
                        Picker("Tip percentage", selection: $tipsPercentage) {
                            ForEach(0..<tipsPercentages.count) {
                                Text("\(self.tipsPercentages[$0])%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section(header: Text("Amount per person")) {
                    Text("$ \(tipCalculator, specifier: "%.2f")")
                }
                Section(header: Text("Total amount")) {
                    Text("Total amount with tip: \(totalAmountPlusTip, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
