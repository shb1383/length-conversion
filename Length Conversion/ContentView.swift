//
//  ContentView.swift
//  Length Conversion
//
//  Created by Syrene Haber Bartolome on 2024/09/19.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = "feet"
    @State private var outputUnit = "yards"
    @FocusState private var inputIsFocused: Bool
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var conversion: Double {
        let feet = inputNumber
        return feet
        
        let meters = feet * 3.281
        return meters
        
        let kilometers = meters * 0.001
        return kilometers
        
        let yards = feet * 1.09361
        return yards
        
        _ = yards * 0.000621371
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Input number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }
                
                Section("Select an input unit") {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Salect an output unit") {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Conversion") {
                    Text(conversion, format: .number)
                }
                .navigationTitle("Length Conversion")
                .toolbar {
                    if inputIsFocused {
                        Button("Done") {
                            inputIsFocused = false
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
