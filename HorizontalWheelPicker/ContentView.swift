//
//  ContentView.swift
//  HorizontalWheelPicker
//
//  Created by Yoda on 2025/11/9.
//

import SwiftUI

struct ContentView: View {
    @State private var config: WheelPicker.Config = .init(count: 10, steps: 5, spacing: 20, multiplier: 10)
    @State private var value: CGFloat = 10
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .lastTextBaseline, spacing: 5, content: {
                    Text(verbatim: "\(value)")
                        .font(.headline.bold())
                        .contentTransition(.numericText(value: value))
                        .animation(.snappy,value: value)
                })
                WheelPicker(config: config, value: $value)
                    .frame(height: 60)
                Button("To Position 60") {
                    withAnimation {
                        value = 60
                    }
                }
                .padding(.top, 20)
            }
            .navigationTitle("Wheel Picker")
        }
        
    }
}

#Preview {
    ContentView()
}
