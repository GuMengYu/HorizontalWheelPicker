# 快速开始指南

## 📦 项目结构

```
HorizontalWheelPicker/
├── Package.swift                    # Swift Package 定义文件
├── Sources/                         # 包源代码（可发布）
│   └── HorizontalWheelPicker/
│       └── WheelPicker.swift       # 主组件（public API）
├── Tests/                           # 单元测试
│   └── HorizontalWheelPickerTests/
├── HorizontalWheelPicker/          # 示例 App 项目
│   ├── ContentView.swift           # 使用示例
│   ├── HorizontalWheelPickerApp.swift
│   └── View/
│       └── WheelPicker.swift       # 原始组件（用于示例）
└── HorizontalWheelPicker.xcodeproj # Xcode 项目
```

## 🚀 使用方式

### 方式 1: 本地开发测试

示例项目（`HorizontalWheelPicker.xcodeproj`）直接包含了组件代码，可以立即运行：

```bash
# 打开 Xcode 项目
open HorizontalWheelPicker.xcodeproj

# 或者使用命令行编译
xcodebuild -project HorizontalWheelPicker.xcodeproj -scheme HorizontalWheelPicker
```

### 方式 2: 作为 Swift Package 使用

#### 在其他项目中引用本地包

1. 在你的 Xcode 项目中，选择 **File** → **Add Package Dependencies...**
2. 点击 **Add Local...** 
3. 选择 `HorizontalWheelPicker` 目录（包含 Package.swift 的目录）
4. 在代码中导入：

```swift
import HorizontalWheelPicker

struct MyView: View {
    @State private var value: CGFloat = 0
    @State private var config = WheelPicker.Config(
        count: 10,
        minValue: -100,
        maxValue: 100
    )
    
    var body: some View {
        WheelPicker(config: config, value: $value)
            .frame(height: 60)
    }
}
```

#### 使用 Package.swift

如果你的项目使用 SPM，在 `Package.swift` 中添加：

```swift
dependencies: [
    .package(path: "/path/to/HorizontalWheelPicker")
]
```

### 方式 3: 从 GitHub 安装（发布后）

#### 步骤 1: 推送到 GitHub

```bash
cd /Users/yoda/Data/code/apple/HorizontalWheelPicker

# 初始化 Git（如果还没有）
git init
git add .
git commit -m "Initial release: HorizontalWheelPicker v1.0.0"

# 添加远程仓库
git remote add origin https://github.com/你的用户名/HorizontalWheelPicker.git

# 推送代码
git branch -M main
git push -u origin main

# 创建版本标签
git tag 1.0.0
git push origin 1.0.0
```

#### 步骤 2: 在其他项目中使用

在 Xcode 中：
- **File** → **Add Package Dependencies...**
- 输入: `https://github.com/你的用户名/HorizontalWheelPicker`
- 选择版本并添加

或在 `Package.swift` 中：

```swift
dependencies: [
    .package(url: "https://github.com/你的用户名/HorizontalWheelPicker", from: "1.0.0")
]
```

## 🧪 测试

运行单元测试：

```bash
# 编译包
swift build

# 运行测试
swift test

# 运行测试并显示详细信息
swift test --verbose
```

## 📝 基本使用示例

### 简单范围（0-100）

```swift
import HorizontalWheelPicker

struct ContentView: View {
    @State private var value: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("值: \(Int(value))")
            
            WheelPicker(
                config: WheelPicker.Config(count: 10),
                value: $value
            )
            .frame(height: 60)
        }
    }
}
```

### 负数范围（-100 到 +100）

```swift
WheelPicker(
    config: WheelPicker.Config(
        count: 20,
        steps: 5,
        spacing: 20,
        multiplier: 10,
        minValue: -100,
        maxValue: 100
    ),
    value: $value
)
.frame(height: 60)
```

### 自定义步进值

```swift
// 0-1000，每次步进 50
WheelPicker(
    config: WheelPicker.Config(
        count: 20,
        steps: 10,
        multiplier: 50,
        minValue: 0
    ),
    value: $value
)
```

## 🔧 配置参数说明

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `count` | `Int` | - | 数值数量（必填） |
| `steps` | `Int` | 10 | 每个主刻度间的细分步数 |
| `spacing` | `CGFloat` | 5 | 刻度间距 |
| `showText` | `Bool` | true | 是否显示数值文本 |
| `multiplier` | `Int` | 10 | 数值乘数 |
| `minValue` | `Int` | 0 | 最小值（支持负数） |
| `maxValue` | `Int?` | nil | 最大值（可选） |

## 📱 平台支持

- ✅ iOS 17.0+
- ✅ macOS 14.0+
- ✅ 触觉反馈（仅 iOS，macOS 自动禁用）

## 🎯 下一步

- 查看 `README.md` 了解更多详细信息
- 查看 `USAGE.md` 了解高级用法
- 运行示例项目查看实际效果
- 阅读源码了解实现细节

## ❓ 常见问题

**Q: 如何修改滚轮颜色？**  
A: 目前使用系统颜色，可以通过修改源码中的 `Color.primary` 和 `.gray` 来自定义。

**Q: 支持竖向滚动吗？**  
A: 当前仅支持横向滚动，竖向滚动需要修改组件实现。

**Q: 可以禁用触觉反馈吗？**  
A: 当前触觉反馈是内置的，可以在源码中移除相关代码。

**Q: 支持小数值吗？**  
A: 当前仅支持整数，小数支持需要修改 Config 结构。

---

🎉 开始使用 HorizontalWheelPicker，打造更好的用户体验！

