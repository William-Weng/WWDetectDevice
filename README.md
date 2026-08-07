[English](./README.en.md) | [繁體中文](./README.md)

# [WWDetectDevice](https://swiftpackageindex.com/William-Weng)

[![Swift-5.10](https://img.shields.io/badge/Swift-5.10-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![iOS-17.0](https://img.shields.io/badge/iOS-17.0-pink.svg?style=flat)](https://developer.apple.com/swift/)
[![SPM](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/)
[![Tag](https://img.shields.io/github/v/tag/William-Weng/WWDetectDevice)](https://github.com/William-Weng/WWDetectDevice/tags)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat)](LICENSE)

https://github.com/user-attachments/assets/f4390531-20fb-4a3f-b207-d53fa3e0c755

一個用來辨識 Apple 裝置型號、機型資訊與螢幕圓角半徑的工具套件。

## ✨ [功能特色](https://peterpanswift.github.io/iphone-bezels/)

- 取得目前裝置的內部識別碼。
- 取得系統相關資訊。
- 讀取各平台裝置資料庫。
- 依照 identifier 查詢裝置型號與資訊。
- 取得裝置圓角半徑。
- 支援 iPhone、iPad、Apple Watch、Apple TV。

## 📘 簡介

`WWDetectDevice` 透過內建的裝置資料與系統 API，幫助你快速取得目前裝置的型號、分類與相關屬性。
適合用在 UI 適配、裝置判斷、圓角計算、顯示特殊機型行為等情境。

## 📦 安裝方式

### 🧰 Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/William-Weng/WWDetectDevice.git", from: "1.5.0")
]
```

## 🚀 使用方式

```swift
import WWDetectDevice

let identifier = WWDetectDevice.deviceIdentifier
let systemInfo = WWDetectDevice.deviceSystemInformation
```

### 🛠 取得裝置資訊

```swift
let info = WWDetectDevice.deviceInformation(identifier: "iPhone15,2")
print(info)
```

### 📐 取得圓角半徑

```swift
if let radius = WWDetectDevice.deviceCornerRadius(identifier: "iPhone15,2") {
    print("corner radius:", radius)
}
```

## 📚 API 說明

| 方法 | 說明 |
| --- | --- |
| `deviceIdentifier` | 取得該裝置的內部編號。 |
| `deviceSystemInformation` | 取得系統的相關資訊。 |
| `deviceModelObject(type:)` | 取得該裝置類型的完整資料物件。 |
| `deviceModel(type:)` | 取得該裝置類型的完整字典資料。 |
| `deviceInformation(identifier:)` | 依照 identifier 取得單一裝置資訊。 |
| `deviceCornerRadius(identifier:)` | 依照 identifier 取得裝置圓角半徑。 |
| `deviceType(identifier:)` | 依照 identifier 取得裝置類型。 |
| `deviceEnum(identifier:)` | 依照 identifier 取得對應的裝置列舉。 |

## ⚠️ 注意事項

- `deviceIdentifier` 需在實機上才會有意義。
- 某些 API 依賴內建資料檔案，請確認資源已正確加入 SPM target。
- `deviceCornerRadius(identifier:)` 可能在找不到資料時回傳 `nil`。
