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
