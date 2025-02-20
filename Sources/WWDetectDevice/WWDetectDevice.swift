//
//  WWDetectDevice.swift
//  WWDetectDevice
//
//  Created by William.Weng on 2024/5/7.
//

import UIKit

// MARK: - 檢測裝置類型
open class WWDetectDevice {
        
    public static let shared = WWDetectDevice()
    
    private init() {}
}

// MARK: - 公開函式
public extension WWDetectDevice {
    
    /// 取得該裝置類型的全文件資料 (iPad / iPhone / AppleTV / AppleWatch)
    /// - Parameter type: DeviceType
    /// - Returns: Any?
    func deviceModelObject(type: DeviceType) -> Any? {
        
        guard let jsonString = Bundle.module._readText(resource: type.resource()),
              let jsonObject = jsonString._jsonObject()
        else {
            return nil
        }
        
        return jsonObject
    }
    
    /// 取得該裝置類型的全文件字典 (iPad / iPhone / AppleTV / AppleWatch)
    /// - Parameter type: DeviceType
    /// - Returns: [String: Any]
    func deviceModel(type: DeviceType) -> [String: Any] {
        
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
    func deviceInformation(identifier: String) -> [String: Any] {
        
        guard let deviceType = deviceType(identifier: identifier) else { return [:] }
        
        let info = deviceInformation(type: deviceType, identifier: identifier)
        return info
    }
    
    /// 取得該裝置的內部編號 (實機才可以)
    /// - Returns: String
    func deviceIdentifier() -> String {
        return UIDevice._identifier()
    }

    /// 依照裝置Id去解析DeviceType
    /// - Parameter identifier: String
    /// - Returns: DeviceTyp?
    func deviceType(identifier: String) -> DeviceType? {
        return DeviceType.find(with: identifier)
    }
        
    /// 依照裝置Id去找出Enum
    /// - Parameters:
    ///   - identifier: 裝置編號
    func deviceEnum(identifier: String) -> (any DeviceEnum)? {
        
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
    
    /// 取得系統的相關資訊
    /// - Returns: Constant.SystemInformation
    func deviceSystemInformation() -> SystemInformation {
        return UIDevice._systemInformation()
    }
}

// MARK: - 小工具
private extension WWDetectDevice {
    
    /// 取得該單一裝置類型的資訊 (iPad / iPhone / AppleTV / AppleWatch)
    /// - Parameters:
    ///   - type: DeviceType
    ///   - identifier: String
    /// - Returns: [String: Any]
    func deviceInformation(type: DeviceType, identifier: String) -> [String: Any] {
        
        guard let model = Optional.some(deviceModel(type: type)),
              let info = model[identifier] as? [String: Any]
        else {
            return [:]
        }
        
        return info
    }
}
