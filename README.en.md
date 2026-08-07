[English](./README.en.md) | [繁體中文](./README.md)

# [WWDetectDevice](https://swiftpackageindex.com/William-Weng)

[![Swift-5.10](https://img.shields.io/badge/Swift-5.10-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![iOS-17.0](https://img.shields.io/badge/iOS-17.0-pink.svg?style=flat)](https://developer.apple.com/swift/)
[![SPM](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/)
[![Tag](https://img.shields.io/github/v/tag/William-Weng/WWDetectDevice)](https://github.com/William-Weng/WWDetectDevice/tags)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat)](LICENSE)

A utility package for detecting Apple device models, system information, and screen corner radius.

## ✨ [Features](https://peterpanswift.github.io/iphone-bezels/)

- Retrieve the current device identifier.
- Access basic system information.
- Load built‑in device metadata for each platform.
- Look up device information by model identifier.
- Get screen corner radius for specific devices.
- Support iPhone, iPad, Apple Watch, and Apple TV.

## 📘 Overview

`WWDetectDevice` uses system APIs and bundled metadata to help you quickly determine the exact device type, category, and related properties.
It’s useful for UI adaptation, device‑specific behavior, and accurate corner radius calculations.

## 📦 Installation

### 🧰 Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/William-Weng/WWDetectDevice.git", from: "1.5.0")
]
```

## 🚀 Usage

```swift
import WWDetectDevice

let identifier = WWDetectDevice.deviceIdentifier
let systemInfo = WWDetectDevice.deviceSystemInformation
```

### 🛠 Fetching device information

```swift
let info = WWDetectDevice.deviceInformation(identifier: "iPhone15,2")
print(info)
```

### 📐 Getting corner radius

```swift
if let radius = WWDetectDevice.deviceCornerRadius(identifier: "iPhone15,2") {
    print("corner radius:", radius)
}
```

## 📚 API

| Method                               | Description                                      |
| ------------------------------------ | ------------------------------------------------ |
| `deviceIdentifier`                   | Returns the current device identifier.          |
| `deviceSystemInformation`           | Returns basic system information.               |
| `deviceModelObject(type:)`          | Returns the full metadata object for a platform.|
| `deviceModel(type:)`                | Returns the full metadata dictionary for a platform. |
| `deviceInformation(identifier:)`    | Returns information for a single device by identifier. |
| `deviceCornerRadius(identifier:)`   | Returns the screen corner radius for a device.  |
| `deviceType(identifier:)`           | Returns the device type for an identifier.      |
| `deviceEnum(identifier:)`           | Returns the matching device enum for an identifier. |

## ⚠️ Notes

- `deviceIdentifier` is only meaningful on a
