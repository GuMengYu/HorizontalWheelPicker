# 更新日志

本文档记录 HorizontalWheelPicker 的所有重要变更。

## [1.0.0] - 2025-11-09

### 新增 ✨

- 🎉 首次发布 HorizontalWheelPicker Swift Package
- 📦 支持 Swift Package Manager 安装
- 🎯 支持正负数范围选择（如 -100 到 +100）
- 📱 iOS 平台触觉反馈支持
- 🎨 高度可定制的配置选项：
  - 自定义步长（steps）
  - 自定义间距（spacing）
  - 自定义乘数（multiplier）
  - 自定义最小值/最大值范围
  - 显示/隐藏数值文本
- 🔄 平滑滚动动画
- 📐 自动居中对齐
- 🎨 蓝色中心指示器
- 📱 多平台支持：iOS 17+ 和 macOS 14+

### 技术特性

- 纯 SwiftUI 实现
- 使用 Composition API
- 支持 SwiftUI Binding
- 包含完整的单元测试（7 个测试用例全部通过）
- 完整的 API 文档注释
- 平台特定代码适配（iOS 触觉反馈，macOS 自动禁用）

### 文档

- ✅ README.md - 项目介绍和功能说明
- ✅ QUICKSTART.md - 快速开始指南
- ✅ USAGE.md - 使用说明和集成方法
- ✅ CHANGELOG.md - 更新日志
- ✅ LICENSE - MIT 许可证

### 测试

- ✅ 配置默认值测试
- ✅ 配置自定义值测试
- ✅ actualMaxValue 计算测试
- ✅ totalRange 计算测试（正数、负数、混合范围）

### 示例项目

- 包含完整的示例 App
- 展示基本用法
- 展示负数范围支持
- 展示程序化设置值
- 展示动画过渡效果

---

## 未来计划 🚀

以下是未来可能添加的功能：

### v1.1.0（计划中）
- [ ] 支持自定义颜色主题
- [ ] 支持自定义刻度高度
- [ ] 添加更多触觉反馈样式选项
- [ ] 支持禁用触觉反馈的配置选项

### v1.2.0（计划中）
- [ ] 支持小数值
- [ ] 支持自定义数字格式化
- [ ] 添加更多动画效果
- [ ] 支持竖向滚动模式

### v2.0.0（计划中）
- [ ] 支持更多自定义选项
- [ ] 性能优化
- [ ] 支持 watchOS
- [ ] 添加更多预设样式

---

## 版本规范

本项目遵循 [语义化版本](https://semver.org/lang/zh-CN/) 规范：

- **主版本号**：不兼容的 API 变更
- **次版本号**：向下兼容的功能性新增
- **修订号**：向下兼容的问题修正

## 贡献

欢迎提交 Issue 和 Pull Request 来帮助改进这个项目！

---

[1.0.0]: https://github.com/你的用户名/HorizontalWheelPicker/releases/tag/1.0.0

