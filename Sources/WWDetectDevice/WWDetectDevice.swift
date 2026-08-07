//
//  WWDetectDevice.swift
//  WWDetectDevice
//
//  Created by William.Weng on 2024/5/7.
//

import UIKit

// MARK: - 檢測裝置類型
public enum WWDetectDevice {}

// MARK: - 公開屬性
public extension WWDetectDevice {
    
    /// 取得該裝置的內部編號 (實機才可以)
    static var deviceIdentifier: String { UIDevice.identifier }
    
    /// 取得系統的相關資訊
    static var deviceSystemInformation: SystemInformation { UIDevice.systemInformation }
    
    /// 快速取得當前應用程式資訊的靜態計算屬性
    static var appInformation: AppInformation { UIDevice.appInformation }
}

// MARK: - 公開API
public extension WWDetectDevice {
    
    /// 取得該裝置類型的全文件資料 (iPad / iPhone / AppleTV / AppleWatch)
    static func deviceModelObject(type: DeviceType) -> Any? {
        
        guard let jsonString = Bundle.module.readText(resource: type.resource()),
              let jsonObject = jsonString.jsonObject()
        else {
            return nil
        }
        
        return jsonObject
    }
    
    /// 取得該裝置類型的全文件字典 (iPad / iPhone / AppleTV / AppleWatch)
    static func deviceModel(type: DeviceType) -> [String: Any] {
        
        guard let object = deviceModelObject(type: type),
              let dictionary = object as? [String: Any]
        else {
            return [:]
        }
        
        return dictionary
    }
    
    /// 取得該單一裝置類型的資訊 (iPad / iPhone / AppleTV / AppleWatch)
    static func deviceInformation(identifier: String) -> [String: Any] {
        
        guard let deviceType = deviceType(identifier: identifier) else { return [:] }
        
        let info = deviceInformation(type: deviceType, identifier: identifier)
        return info
    }
    
    /// [取得該單一裝置圓角半徑](https://github.com/kylebshr/ScreenCorners)
    static func deviceCornerRadius(identifier: String) -> CGFloat? {
        
        let info = deviceInformation(identifier: identifier)
        
        guard !info.isEmpty,
              let cornerRadius = info["corner"] as? CGFloat
        else {
            return nil
        }
        
        return cornerRadius
    }
    
    /// 依照裝置Id去解析DeviceType
    static func deviceType(identifier: String) -> DeviceType? {
        return DeviceType.find(with: identifier)
    }
    
    /// 依照裝置編號去找出Enum
    static func deviceEnum(identifier: String) -> (any DeviceEnum)? {
        
        guard let deviceType = DeviceType.find(with: identifier) else { return nil }
        
        let deviceEnum: (any DeviceEnum)?
        
        switch deviceType {
        case .iPhone: deviceEnum = iPhoneType.find(with: identifier)
        case .iPad: deviceEnum = iPadType.find(with: identifier)
        case .AppleWatch: deviceEnum = AppleWatchType.find(with: identifier)
        case .AppleTV: deviceEnum = AppleTVType.find(with: identifier)
        }
        
        return deviceEnum
    }
    
    /// 透過自訂或預設的 Key 類型，讀取 Info.plist 內任意型態設定值的靜態函式
    /// - Parameters:
    ///   - bundle: 要讀取的目標 Bundle，預設為主要 App 的 `.main`
    ///   - type: 讀取的 Key 類型（支援自訂字串或預設列舉）
    /// - Returns: 回傳對應的值（型態為 Any?），若找不到則回傳 `nil`
    static func infoValue(by bundle: Bundle = .main, forKey type: InfoKeyType) -> Any? {
        switch type {
        case .custom(let key): return bundle.infoDictionary?[key]
        case .type(let key): return bundle.infoDictionary(forKey: key)
        }
    }
}

// MARK: - 小工具
private extension WWDetectDevice {
    
    /// 取得該單一裝置類型的資訊 (iPad / iPhone / AppleTV / AppleWatch)
    static func deviceInformation(type: DeviceType, identifier: String) -> [String: Any] {
        
        guard let model = Optional.some(deviceModel(type: type)),
              let info = model[identifier] as? [String: Any]
        else {
            return [:]
        }
        
        return info
    }
}
