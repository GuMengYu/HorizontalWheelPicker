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
          let totalSteps = config.steps * config.totalRange
          ForEach(0...totalSteps, id: \.self) { index in
            let remainder = index % config.steps
            let actualValue = config.minValue + (index / config.steps) * config.multiplier
            Divider()
              .background(remainder == 0 ? Color.primary : .gray)
              .frame(width: 0, height: remainder == 0 ? 20 : 10, alignment: .center)
              .frame(maxHeight: 20, alignment: .center)
              .overlay(alignment: .bottom) {
                if remainder == 0 && config.showText {
                  Text("\(actualValue)")
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
            let position: Int? =
              isLoaded ? ((Int(value) - config.minValue) * config.steps) / config.multiplier : nil
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
              value =
                CGFloat(config.minValue)
                + (CGFloat(newValue) / CGFloat(config.steps) * CGFloat(config.multiplier))
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
    /// 最小值，支持负数
    var minValue: Int = 0
    /// 最大值
    var maxValue: Int? = nil

    /// 计算实际的最大值
    var actualMaxValue: Int {
      return maxValue ?? (count * multiplier)
    }

    /// 计算实际的范围总数
    var totalRange: Int {
      return (actualMaxValue - minValue) / multiplier
    }
  }
}

#Preview {
  ContentView()
}
