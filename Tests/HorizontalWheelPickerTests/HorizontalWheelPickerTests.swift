//
//  HorizontalWheelPickerTests.swift
//  HorizontalWheelPicker
//
//  Created by Yoda on 2025/11/9.
//

import XCTest

@testable import HorizontalWheelPicker

final class HorizontalWheelPickerTests: XCTestCase {

  func testConfigDefaultValues() {
    let config = WheelPicker.Config(count: 10)

    XCTAssertEqual(config.count, 10)
    XCTAssertEqual(config.steps, 10)
    XCTAssertEqual(config.spacing, 5)
    XCTAssertEqual(config.showText, true)
    XCTAssertEqual(config.multiplier, 10)
    XCTAssertEqual(config.minValue, 0)
    XCTAssertNil(config.maxValue)
  }

  func testConfigCustomValues() {
    let config = WheelPicker.Config(
      count: 20,
      steps: 5,
      spacing: 10,
      showText: false,
      multiplier: 5,
      minValue: -100,
      maxValue: 100
    )

    XCTAssertEqual(config.count, 20)
    XCTAssertEqual(config.steps, 5)
    XCTAssertEqual(config.spacing, 10)
    XCTAssertEqual(config.showText, false)
    XCTAssertEqual(config.multiplier, 5)
    XCTAssertEqual(config.minValue, -100)
    XCTAssertEqual(config.maxValue, 100)
  }

  func testActualMaxValueWithoutMaxValue() {
    let config = WheelPicker.Config(count: 10, multiplier: 10)
    XCTAssertEqual(config.actualMaxValue, 100)
  }

  func testActualMaxValueWithMaxValue() {
    let config = WheelPicker.Config(count: 10, multiplier: 10, maxValue: 150)
    XCTAssertEqual(config.actualMaxValue, 150)
  }

  func testTotalRangePositive() {
    let config = WheelPicker.Config(count: 10, multiplier: 10, minValue: 0, maxValue: 100)
    XCTAssertEqual(config.totalRange, 10)
  }

  func testTotalRangeWithNegative() {
    let config = WheelPicker.Config(count: 10, multiplier: 10, minValue: -100, maxValue: 100)
    XCTAssertEqual(config.totalRange, 20)
  }

  func testTotalRangeNegativeOnly() {
    let config = WheelPicker.Config(count: 10, multiplier: 10, minValue: -100, maxValue: -50)
    XCTAssertEqual(config.totalRange, 5)
  }
}
