# HorizontalWheelPicker

一个美观、流畅的 SwiftUI 横向滚轮选择器组件，支持正负数值范围选择，并提供触觉反馈。

![Platform](https://img.shields.io/badge/platform-iOS%2017%2B%20%7C%20macOS%2014%2B-blue)
![Swift](https://img.shields.io/badge/Swift-5.9+-orange)
![SPM](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen)

## ✨ 特性

- 🎯 **支持正负数范围**：可设置任意数值范围（如 -100 到 +100）
- 📱 **触觉反馈**：滚动到刻度时提供轻触反馈
- 🎨 **高度可定制**：支持自定义步长、间距、显示样式等
- 🔄 **平滑动画**：流畅的滚动体验
- 💯 **纯 SwiftUI**：原生 SwiftUI 实现，无第三方依赖
- 📦 **Swift Package Manager**：轻松集成到项目中

## 📦 安装

### Swift Package Manager

在 Xcode 中：

1. 选择 **File** → **Add Package Dependencies...**
2. 输入仓库地址：
   ```
   https://github.com/你的用户名/HorizontalWheelPicker
   ```
3. 选择版本并添加到项目

或在 `Package.swift` 中添加依赖：

```swift
dependencies: [
    .package(url: "https://github.com/你的用户名/HorizontalWheelPicker", from: "1.0.0")
]
```

## 🚀 快速开始

### 基础用法

```swift
import SwiftUI
import HorizontalWheelPicker

struct ContentView: View {
    @State private var value: CGFloat = 0
    @State private var config = WheelPicker.Config(
        count: 10,
        steps: 5,
        spacing: 20,
        multiplier: 10
    )
    
    var body: some View {
        VStack {
            Text("当前值: \(Int(value))")
                .font(.title)
            
            WheelPicker(config: config, value: $value)
                .frame(height: 60)
        }
    }
}
```

### 支持负数范围

```swift
@State private var config = WheelPicker.Config(
    count: 10,
    steps: 5,
    spacing: 20,
    multiplier: 10,
    minValue: -100,    // 最小值
    maxValue: 100      // 最大值
)
@State private var value: CGFloat = 0

var body: some View {
    VStack {
        Text("温度: \(Int(value))°C")
            .font(.headline)
        
        WheelPicker(config: config, value: $value)
            .frame(height: 60)
    }
}
```

### 程序化设置值

```swift
Button("设置为 50") {
    withAnimation {
        value = 50
    }
}

Button("设置为 -30") {
    withAnimation {
        value = -30
    }
}
```

## ⚙️ 配置选项

`WheelPicker.Config` 提供了丰富的配置选项：

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `count` | `Int` | - | 数值数量（当不使用 `maxValue` 时） |
| `steps` | `Int` | `10` | 每个主刻度之间的细分步数 |
| `spacing` | `CGFloat` | `5` | 刻度之间的间距 |
| `showText` | `Bool` | `true` | 是否显示数值文本 |
| `multiplier` | `Int` | `10` | 数值步进乘数 |
| `minValue` | `Int` | `0` | 最小值（支持负数） |
| `maxValue` | `Int?` | `nil` | 最大值（可选） |

### 配置示例

```swift
// 示例 1: 0-100 的标准选择器，步进 1
let config1 = WheelPicker.Config(
    count: 100,
    steps: 10,
    spacing: 5,
    multiplier: 1,
    minValue: 0
)

// 示例 2: -50 到 +50 的温度选择器
let config2 = WheelPicker.Config(
    count: 10,
    steps: 5,
    spacing: 20,
    multiplier: 10,
    minValue: -50,
    maxValue: 50
)

// 示例 3: 0-1000，步进 50
let config3 = WheelPicker.Config(
    count: 20,
    steps: 5,
    spacing: 15,
    multiplier: 50,
    minValue: 0
)
```

## 📱 系统要求

- iOS 17.0+
- macOS 14.0+
- Swift 5.9+
- Xcode 15.0+

## 🎬 示例项目

本仓库包含一个完整的示例项目，展示了各种用法。克隆仓库后，在 Xcode 中打开 `HorizontalWheelPicker.xcodeproj` 即可运行。

## 📄 许可证

MIT License

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📮 联系方式

如有问题或建议，请通过 GitHub Issues 联系。

---

⭐ 如果这个项目对你有帮助，请给个 Star 支持一下！

