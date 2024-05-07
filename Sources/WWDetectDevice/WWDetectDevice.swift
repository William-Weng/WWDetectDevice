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
    
    /// 取得該單一裝置類型的資訊 (iPad / iPhone / AppleTV / AppleWatch)
    /// - Parameters:
    ///   - identifier: String
    /// - Returns: [String: Any]
    func deviceInformation(identifier: String) -> [String: Any] {
        
        guard let type = parseDeviceType(identifier: identifier) else { return [:] }
        let info = deviceInformation(type: type, identifier: identifier)
        
        return info
    }
    
    /// 依照裝置Id去解析DeviceType
    /// - Parameter identifier: String
    /// - Returns: DeviceTyp?
    func parseDeviceType(identifier: String) -> DeviceType? {
        
        let type = DeviceType.allCases.first { type in
            if (!identifier.hasPrefix(type.prefix())) { return false }
            return true
        }
        
        return type
    }
}
