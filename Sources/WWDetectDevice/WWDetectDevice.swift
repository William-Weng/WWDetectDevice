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
    /// - Returns: String
    static var deviceIdentifier: String {
        UIDevice.identifier
    }
    
    /// 取得系統的相關資訊
    /// - Returns: SystemInformation
    static var deviceSystemInformation: SystemInformation {
        UIDevice.systemInformation
    }
}

// MARK: - 公開API
public extension WWDetectDevice {
    
    /// 取得該裝置類型的全文件資料 (iPad / iPhone / AppleTV / AppleWatch)
    /// - Parameter type: DeviceType
    /// - Returns: Any?
    static func deviceModelObject(type: DeviceType) -> Any? {
        
        guard let jsonString = Bundle.module.readText(resource: type.resource()),
              let jsonObject = jsonString.jsonObject()
        else {
            return nil
        }
        
        return jsonObject
    }
    
    /// 取得該裝置類型的全文件字典 (iPad / iPhone / AppleTV / AppleWatch)
    /// - Parameter type: DeviceType
    /// - Returns: [String: Any]
    static func deviceModel(type: DeviceType) -> [String: Any] {
        
        guard let object = deviceModelObject(type: type),
              let dictionary = object as? [String: Any]
        else {
            return [:]
        }
        
        return dictionary
    }
    
    /// 取得該單一裝置類型的資訊 (iPad / iPhone / AppleTV / AppleWatch)
    /// - Parameters:
    ///   - identifier: String
    /// - Returns: [String: Any]
    static func deviceInformation(identifier: String) -> [String: Any] {
        
        guard let deviceType = deviceType(identifier: identifier) else { return [:] }
        
        let info = deviceInformation(type: deviceType, identifier: identifier)
        return info
    }
    
    /// [取得該單一裝置圓角半徑](https://github.com/kylebshr/ScreenCorners)
    /// - Parameters:
    ///   - identifier: String
    /// - Returns: CGFloat?
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
    /// - Parameter identifier: String
    /// - Returns: DeviceTyp?
    static func deviceType(identifier: String) -> DeviceType? {
        return DeviceType.find(with: identifier)
    }
    
    /// 依照裝置Id去找出Enum
    /// - Parameters:
    ///   - identifier: 裝置編號
    static func deviceEnum(identifier: String) -> (any DeviceEnum)? {
        
        guard let deviceType = WWDetectDevice.DeviceType.find(with: identifier) else { return nil }
        
        let deviceEnum: (any DeviceEnum)?
        
        switch deviceType {
        case .iPhone: deviceEnum = WWDetectDevice.iPhoneType.find(with: identifier)
        case .iPad: deviceEnum = WWDetectDevice.iPadType.find(with: identifier)
        case .AppleWatch: deviceEnum = WWDetectDevice.AppleWatchType.find(with: identifier)
        case .AppleTV: deviceEnum = WWDetectDevice.AppleTVType.find(with: identifier)
        }
        
        return deviceEnum
    }
}

// MARK: - 小工具
private extension WWDetectDevice {
    
    /// 取得該單一裝置類型的資訊 (iPad / iPhone / AppleTV / AppleWatch)
    /// - Parameters:
    ///   - type: DeviceType
    ///   - identifier: String
    /// - Returns: [String: Any]
    static func deviceInformation(type: DeviceType, identifier: String) -> [String: Any] {
        
        guard let model = Optional.some(deviceModel(type: type)),
              let info = model[identifier] as? [String: Any]
        else {
            return [:]
        }
        
        return info
    }
}
