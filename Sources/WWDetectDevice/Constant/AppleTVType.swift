//
//  AppleTVType.swift
//  WWDetectDevice
//
//  Created by William.Weng on 2026/8/7.
//

import Foundation

// MARK: - AppleTV在販售時的名字
enum AppleTVType: DeviceEnum, CaseIterable {
    
    case AppleTV_1st
    case AppleTV_2nd
    case AppleTV_3rd
    case AppleTV_4th
    case AppleTV_4K
    case AppleTV_4K_2nd
    case AppleTV_4K_3rd
    case AppleTV_4K_4th
    
    /// 使用內建Id去取得該AppleTV的名稱 ("AppleTV6,2" => .AppleTV_4K)
    /// - Parameter identifier: String
    /// - Returns: AppleTVType?
    static public func find(with identifier: String) -> AppleTVType? {
        
        let models: [String: AppleTVType] = [
            "AppleTV1,1": .AppleTV_1st,
            "AppleTV2,1": .AppleTV_2nd,
            "AppleTV3,1": .AppleTV_3rd,
            "AppleTV3,2": .AppleTV_3rd,
            "AppleTV5,3": .AppleTV_4th,
            "AppleTV6,2": .AppleTV_4K,
            "AppleTV11,1": .AppleTV_4K_2nd,
            "AppleTV14,1": .AppleTV_4K_3rd,
            "AppleTV18,1": .AppleTV_4K_4th
        ]
        
        return models[identifier]
    }
}
