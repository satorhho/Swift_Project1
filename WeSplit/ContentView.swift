//
//  ContentView.swift
//  WeSplit
//
//  Created by Lance Kent Briones on 4/7/20.
//  Copyright © 2020 Lance Kent Briones. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var check_amount: String = ""
    @State private var number_of_people: Int = 0
    @State private var tip_percentage: Int = 2
    
    var shared_amount: Double {
        let check_store = Double(check_amount) ?? 0
        let percentage_store = Double(percentages[tip_percentage])
        let people_store = Double(number_of_people + 1)
        
        let percentage = check_store * (percentage_store * pow(Double(10), Double(-2)))
        let grand = check_store + percentage
        let output = grand / people_store
        
        return output
    }
    
    let percentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount:", text: $check_amount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people:", selection: $number_of_people){
                        ForEach(1..<100){
                            Text("\($0)")
                        }
                    }
                }
                Section(header: Text("Tip Percentage:")){
                    Picker("%", selection: $tip_percentage){
                        ForEach(0..<percentages.count){
                            Text("\(self.percentages[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("$\(self.shared_amount, specifier: "%.2f")")
                }
            }.navigationBarTitle(Text("WeSplit"), displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
