//
//  iPhoneType.swift
//  WWDetectDevice
//
//  Created by William.Weng on 2026/8/7.
//

import Foundation

// MARK: - iPhone在販售時的名字
enum iPhoneType: DeviceEnum, CaseIterable {
    
    case iPhone
    case iPhone_3G
    case iPhone_3GS
    case iPhone_4
    case iPhone_4S
    case iPhone_5
    case iPhone_5c
    case iPhone_5s
    case iPhone_6_Plus
    case iPhone_6
    case iPhone_6s
    case iPhone_6s_Plus
    case iPhone_SE
    case iPhone_7
    case iPhone_7_Plus
    case iPhone_8
    case iPhone_8_Plus
    case iPhone_X
    case iPhone_XS
    case iPhone_XS_Max
    case iPhone_XR
    case iPhone_11
    case iPhone_11_Pro
    case iPhone_11_Pro_Max
    case iPhone_SE_2nd
    case iPhone_12_mini
    case iPhone_12
    case iPhone_12_Pro
    case iPhone_12_Pro_Max
    case iPhone_13_Pro
    case iPhone_13_Pro_Max
    case iPhone_13_mini
    case iPhone_13
    case iPhone_SE_3rd
    case iPhone_14
    case iPhone_14_Plus
    case iPhone_14_Pro
    case iPhone_14_Pro_Max
    case iPhone_15
    case iPhone_15_Plus
    case iPhone_15_Pro
    case iPhone_15_Pro_Max
    case iPhone_16_Pro
    case iPhone_16_Pro_Max
    case iPhone_16
    case iPhone_16_Plus
    case iPhone_16e
    case iPhone_17_Pro
    case iPhone_17_Pro_Max
    case iPhone_17
    case iPhone_Air
    case iPhone_17e
    case iPhone_18_Pro
    case iPhone_18_Pro_Max
    case iPhone_Duo
    
    /// 使用內建Id去取得該手機的名稱 ("iPhone14,5" => .iPhone_13)
    /// - Parameter identifier: String
    /// - Returns: iPhoneType?
    static public func find(with identifier: String) -> iPhoneType? {
        
        let models: [String: iPhoneType] = [
            "iPhone1,1": .iPhone,
            "iPhone1,2": .iPhone_3G,
            "iPhone2,1": .iPhone_3GS,
            "iPhone3,1": .iPhone_4,
            "iPhone3,2": .iPhone_4,
            "iPhone3,3": .iPhone_4,
            "iPhone4,1": .iPhone_4S,
            "iPhone5,1": .iPhone_5,
            "iPhone5,2": .iPhone_5,
            "iPhone5,3": .iPhone_5c,
            "iPhone5,4": .iPhone_5c,
            "iPhone6,1": .iPhone_5s,
            "iPhone6,2": .iPhone_5s,
            "iPhone7,1": .iPhone_6_Plus,
            "iPhone7,2": .iPhone_6,
            "iPhone8,1": .iPhone_6s,
            "iPhone8,2": .iPhone_6s_Plus,
            "iPhone8,4": .iPhone_SE,
            "iPhone9,1": .iPhone_7,
            "iPhone9,2": .iPhone_7_Plus,
            "iPhone9,3": .iPhone_7,
            "iPhone9,4": .iPhone_7_Plus,
            "iPhone10,1": .iPhone_8,
            "iPhone10,2": .iPhone_8_Plus,
            "iPhone10,3": .iPhone_X,
            "iPhone10,4": .iPhone_8,
            "iPhone10,5": .iPhone_8_Plus,
            "iPhone10,6": .iPhone_X,
            "iPhone11,2": .iPhone_XS,
            "iPhone11,6": .iPhone_XS_Max,
            "iPhone11,8": .iPhone_XR,
            "iPhone12,1": .iPhone_11,
            "iPhone12,3": .iPhone_11_Pro,
            "iPhone12,5": .iPhone_11_Pro_Max,
            "iPhone12,8": .iPhone_SE_2nd,
            "iPhone13,1": .iPhone_12_mini,
            "iPhone13,2": .iPhone_12,
            "iPhone13,3": .iPhone_12_Pro,
            "iPhone13,4": .iPhone_12_Pro_Max,
            "iPhone14,2": .iPhone_13_Pro,
            "iPhone14,3": .iPhone_13_Pro_Max,
            "iPhone14,4": .iPhone_13_mini,
            "iPhone14,5": .iPhone_13,
            "iPhone14,6": .iPhone_SE_3rd,
            "iPhone14,7": .iPhone_14,
            "iPhone14,8": .iPhone_14_Plus,
            "iPhone15,2": .iPhone_14_Pro,
            "iPhone15,3": .iPhone_14_Pro_Max,
            "iPhone15,4": .iPhone_15,
            "iPhone15,5": .iPhone_15_Plus,
            "iPhone16,1": .iPhone_15_Pro,
            "iPhone16,2": .iPhone_15_Pro_Max,
            "iPhone17,1": .iPhone_16_Pro,
            "iPhone17,2": .iPhone_16_Pro_Max,
            "iPhone17,3": .iPhone_16,
            "iPhone17,4": .iPhone_16_Plus,
            "iPhone17,5": .iPhone_16e,
            "iPhone18,1": .iPhone_17_Pro,
            "iPhone18,2": .iPhone_17_Pro_Max,
            "iPhone18,3": .iPhone_17,
            "iPhone18,4": .iPhone_Air,
            "iPhone18,5": .iPhone_17e,
            "iPhone19,2": .iPhone_18_Pro,
            "iPhone19,3": .iPhone_18_Pro_Max,
            "iPhone19,4": .iPhone_Duo
        ]
        
        return models[identifier]
    }
}
