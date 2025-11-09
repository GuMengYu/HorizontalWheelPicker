# 使用说明

## 在现有的 Demo 项目中引用本地包

本仓库包含了一个示例项目（HorizontalWheelPicker.xcodeproj），展示了如何使用 HorizontalWheelPicker 组件。

### 方式一：在 Xcode 项目中添加本地包

1. 打开 `HorizontalWheelPicker.xcodeproj`
2. 在项目导航器中选择项目文件
3. 选择 **HorizontalWheelPicker** target
4. 点击 **General** 标签页
5. 在 **Frameworks, Libraries, and Embedded Content** 部分，点击 **+** 按钮
6. 选择 **Add Other...** → **Add Package Dependency...**
7. 点击 **Add Local...** 按钮
8. 选择本仓库的根目录（包含 Package.swift 的目录）
9. 点击 **Add Package**

### 方式二：使用 Package.swift（推荐用于纯 SPM 项目）

如果你的项目完全使用 Swift Package Manager，在 `Package.swift` 中添加：

```swift
dependencies: [
    .package(path: "../HorizontalWheelPicker") // 相对路径
]
```

### 方式三：从 GitHub 添加（发布后）

```swift
dependencies: [
    .package(url: "https://github.com/你的用户名/HorizontalWheelPicker", from: "1.0.0")
]
```

## 示例项目结构

```
HorizontalWheelPicker/
├── Package.swift                    # SPM 包定义
├── Sources/                         # 包源代码
│   └── HorizontalWheelPicker/
│       └── WheelPicker.swift       # 主组件
├── Tests/                           # 测试
│   └── HorizontalWheelPickerTests/
├── HorizontalWheelPicker/          # 示例项目
│   ├── ContentView.swift           # 示例代码
│   └── ...
└── HorizontalWheelPicker.xcodeproj # Xcode 项目
```

## 导入和使用

在需要使用的文件中导入：

```swift
import HorizontalWheelPicker
```

然后就可以使用 `WheelPicker` 组件了。

## 运行示例项目

1. 在 Xcode 中打开 `HorizontalWheelPicker.xcodeproj`
2. 选择 iOS 模拟器或真机
3. 点击运行按钮（⌘R）

示例项目展示了：
- 基本用法
- 负数范围支持
- 程序化设置值
- 动画过渡

## 发布到 GitHub

如果要将此包发布到 GitHub：

1. 在 GitHub 上创建新仓库
2. 在本地执行：
   ```bash
   cd /path/to/HorizontalWheelPicker
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/你的用户名/HorizontalWheelPicker.git
   git push -u origin main
   ```

3. 创建版本标签：
   ```bash
   git tag 1.0.0
   git push origin 1.0.0
   ```

之后，其他人就可以通过 URL 引用你的包了。

