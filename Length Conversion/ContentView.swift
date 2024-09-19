//
//  ContentView.swift
//  Length Conversion
//
//  Created by Syrene Haber Bartolome on 2024/09/19.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = "meters"
    @State private var outputUnit = "meters"
    @FocusState private var inputIsFocused: Bool

    let units = ["meters", "kilometers", "feet", "yards", "miles"]

    var conversion: Double {
        var meters = inputNumber
        
        // Convert input number to meters
        switch inputUnit {
        case "feet":
            meters /= 3.281
        case "yards":
            meters /= 1.09361
        case "miles":
            meters /= 0.000621371
        case "kilometers":
            meters *= 1000
        default:
            break
        }

        // Convert meters to the desired output unit
        switch outputUnit {
        case "feet":
            return meters * 3.281
        case "yards":
            return meters * 1.09361
        case "miles":
            return meters * 0.000621371
        case "kilometers":
            return meters / 1000
        default: // meters
            return meters
        }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Enter number") {
                    TextField("Input number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }

                Section("Select input unit") {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Select output unit") {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Conversion result") {
                    Text(conversion, format: .number)
                }
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

#Preview {
    ContentView()
}
