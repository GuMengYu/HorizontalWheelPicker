//
//  WheelPicker.swift
//  HorizontalWheelPicker
//
//  Created by Yoda on 2025/11/9.
//

import SwiftUI

struct WheelPicker: View {
  var config: Config
  @Binding var value: CGFloat
  @State private var isLoaded: Bool = false
  @State private var lastPosition: Int? = nil
  var body: some View {
    GeometryReader { proxy in

      let horiztalPadding = proxy.size.width / 2
      ScrollView(.horizontal) {
        HStack(spacing: config.spacing) {
          let totalSteps = config.steps * config.count
          ForEach(0...totalSteps, id: \.self) { index in
            let remainder = index % config.steps
            Divider()
              .background(remainder == 0 ? Color.primary : .gray)
              .frame(width: 0, height: remainder == 0 ? 20 : 10, alignment: .center)
              .frame(maxHeight: 20, alignment: .center)
              .overlay(alignment: .bottom) {
                if remainder == 0 && config.showText {
                  Text("\((index / config.steps) * config.multiplier)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .fixedSize()
                    .offset(y: 20)
                }
              }
          }
        }
        .frame(height: proxy.size.height)
        .scrollTargetLayout()
      }
      .scrollIndicators(.hidden)
      .scrollTargetBehavior(.viewAligned)
      .scrollPosition(
        id: .init(
          get: {
            let position: Int? = isLoaded ? (Int(value) * config.steps) / config.multiplier : nil
            return position
          },
          set: { newValue in
            if let newValue {
              // 当滚动到新的刻度时触发震动反馈
              if lastPosition != newValue {
                let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                feedbackGenerator.prepare()
                feedbackGenerator.impactOccurred()
                lastPosition = newValue
              }
              value = CGFloat(newValue) / CGFloat(config.steps) * CGFloat(config.multiplier)
            }
          })
      )
      .overlay(
        alignment: .center,
        content: {
          Rectangle()
            .frame(width: 2, height: 40)
            .foregroundStyle(.blue)
            .padding(.bottom, 20)
        }
      )
      .safeAreaPadding(.horizontal, horiztalPadding)
      .onAppear {
        if !isLoaded {
          isLoaded = true
        }
      }
    }
  }
  struct Config: Equatable {
    var count: Int
    var steps: Int = 10
    var spacing: CGFloat = 5
    var showText: Bool = true
    var multiplier: Int = 10
  }
}

#Preview {
  ContentView()
}
