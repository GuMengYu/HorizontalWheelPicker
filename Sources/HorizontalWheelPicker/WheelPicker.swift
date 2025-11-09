//
//  WheelPicker.swift
//  HorizontalWheelPicker
//
//  Created by Yoda on 2025/11/9.
//

import SwiftUI

#if canImport(UIKit)
  import UIKit
#endif

/// 横向滚轮选择器组件
///
/// 一个支持横向滚动的数值选择器，支持正数和负数范围，并提供触觉反馈。
public struct WheelPicker: View {
  var config: Config
  @Binding var value: CGFloat
  @State private var isLoaded: Bool = false
  @State private var lastPosition: Int? = nil

  /// 初始化 WheelPicker
  /// - Parameters:
  ///   - config: 配置选项
  ///   - value: 绑定的当前值
  public init(config: Config, value: Binding<CGFloat>) {
    self.config = config
    self._value = value
  }

  public var body: some View {
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
                #if canImport(UIKit)
                  let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
                  feedbackGenerator.prepare()
                  feedbackGenerator.impactOccurred()
                #endif
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
  /// 滚轮选择器配置
  public struct Config: Equatable {
    /// 数值的数量（当不使用 maxValue 时生效）
    public var count: Int
    /// 每个数值之间的步数（刻度细分）
    public var steps: Int
    /// 刻度之间的间距
    public var spacing: CGFloat
    /// 是否显示数值文本
    public var showText: Bool
    /// 数值乘数（步进值）
    public var multiplier: Int
    /// 最小值，支持负数
    public var minValue: Int
    /// 最大值（可选，如不设置则使用 count * multiplier）
    public var maxValue: Int?

    /// 初始化配置
    /// - Parameters:
    ///   - count: 数值的数量，默认 10
    ///   - steps: 每个数值之间的步数，默认 10
    ///   - spacing: 刻度之间的间距，默认 5
    ///   - showText: 是否显示数值文本，默认 true
    ///   - multiplier: 数值乘数（步进值），默认 10
    ///   - minValue: 最小值，默认 0
    ///   - maxValue: 最大值，默认 nil（使用 count * multiplier）
    public init(
      count: Int,
      steps: Int = 10,
      spacing: CGFloat = 5,
      showText: Bool = true,
      multiplier: Int = 10,
      minValue: Int = 0,
      maxValue: Int? = nil
    ) {
      self.count = count
      self.steps = steps
      self.spacing = spacing
      self.showText = showText
      self.multiplier = multiplier
      self.minValue = minValue
      self.maxValue = maxValue
    }

    /// 计算实际的最大值
    public var actualMaxValue: Int {
      return maxValue ?? (count * multiplier)
    }

    /// 计算实际的范围总数
    public var totalRange: Int {
      return (actualMaxValue - minValue) / multiplier
    }
  }
}
