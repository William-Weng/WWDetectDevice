//
//  Constant.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit

// MARK: - APPLE裝置分類
public enum DeviceType: CaseIterable {
    
    case iPhone
    case iPad
    case AppleTV
    case AppleWatch
    
    /// 根據裝置Id找尋分類
    /// - Parameter identifier: 裝置Id
    /// - Returns: DeviceType?
    public static func find(with identifier: String) -> DeviceType? {
        
        for deviceType in DeviceType.allCases {
            if (identifier.contains(deviceType.prefix())) { return deviceType }
        }
        
        return nil
    }
    
    /// 對應的文件名稱
    /// - Returns: String
    func resource() -> String {
        switch self {
        case .iPhone: return "/JSON/iPhoneModel.json"
        case .iPad: return "/JSON/iPadModel.json"
        case .AppleTV: return "/JSON/AppleTVModel.json"
        case .AppleWatch: return "/JSON/AppleWatchModel.json"
        }
    }
    
    /// 類型前綴字
    /// - Returns: String
    func prefix() -> String {
        switch self {
        case .iPhone: return "iPhone"
        case .iPad: return "iPad"
        case .AppleTV: return "AppleTV"
        case .AppleWatch: return "Watch"
        }
    }
}

/// 定義 Info.plist 查詢鍵值的雙軌制類型
public enum InfoKeyType {
    case custom(_ key: String)          // 彈性模式：允許直接輸入任意的字串鍵值（例如第三方 SDK 自訂的 Key）
    case type(_ key: InfoPlistKey)      // 安全模式：強制使用定義好的 InfoPlistKey 列舉（避免打字錯誤）
}
