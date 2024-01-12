//
//  ContentView.swift
//  UnitPlay
//
//  Created by Mit Sheth on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = Measurement(value: 0.0, unit: UnitLength.meters)
    @State private var sourceUnit = UnitLength.meters
    @State private var outputUnit = UnitLength.centimeters
    
    let units: [UnitLength] = [.centimeters, .meters, .kilometers]
    
    var conversion: Measurement<UnitLength> {
        return userInput.converted(to: outputUnit)
        
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert from") {
                    Picker("Unit", selection: $sourceUnit) {
                        ForEach (units, id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Convert to") {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach (units, id: \.self) { unit in
                            Text(unit.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Input") {
                    TextField("User Input", value: $userInput.value, formatter: NumberFormatter())
                }
                Section("Converted Result") {
                    Text("\(conversion.value, format: .number)")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
