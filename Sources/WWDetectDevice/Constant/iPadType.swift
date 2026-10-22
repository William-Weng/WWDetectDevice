//
//  iPadType.swift
//  WWDetectDevice
//
//  Created by William.Weng on 2026/8/7.
//

import Foundation

// MARK: - iPad在販售時的名字
enum iPadType: DeviceEnum, CaseIterable {
    
    case iPad
    case iPad_2
    case iPad_mini
    case iPad_3rd
    case iPad_4th
    case iPad_Air
    case iPad_mini_2
    case iPad_mini_3
    case iPad_mini_4
    case iPad_Air_2
    case iPad_Pro_9_7_inch
    case iPad_Pro_12_9_inch
    case iPad_5th
    case iPad_Pro_12_9_inch_2nd
    case iPad_Pro_10_5_inch
    case iPad_6th
    case iPad_7th
    case iPad_Pro_11_inch
    case iPad_Pro_12_9_inch_3rd
    case iPad_Pro_11_inch_2nd
    case iPad_Pro_12_9_inch_4th
    case iPad_mini_5th
    case iPad_Air_3rd
    case iPad_8th
    case iPad_9th
    case iPad_Air_4th
    case iPad_Pro_11_inch_3rd
    case iPad_Pro_12_9_inch_5th
    case iPad_Air_5th
    case iPad_10th
    case iPad_mini_6th
    case iPad_Pro_11_inch_4rd
    case iPad_Pro_12_9_inch_6th
    case iPad_Air_13_inch_6th
    case iPad_Air_11_inch_7th
    case iPad_Air_13_inch_7th
    case iPad_11th
    case iPad_mini_7th
    case iPad_Pro_11_inch_5th
    case iPad_Pro_13_inch_7th
    case iPad_Air_11_inch_M4
    case iPad_Air_13_inch_M4
    case iPad_Pro_11_inch_M5
    case iPad_Pro_13_inch_M5

    /// 使用內建Id去取得該平板的名稱 ("iPad11,3" => .iPad_Air_3rd)
    /// - Parameter identifier: String
    /// - Returns: iPhoneType?
    static public func find(with identifier: String) -> iPadType? {
        
        let models: [String: iPadType] = [
            "iPad1,1": .iPad,
            "iPad2,1": .iPad_2,
            "iPad2,2": .iPad_2,
            "iPad2,3": .iPad_2,
            "iPad2,4": .iPad_2,
            "iPad2,5": .iPad_mini,
            "iPad2,6": .iPad_mini,
            "iPad2,7": .iPad_mini,
            "iPad3,1": .iPad_3rd,
            "iPad3,2": .iPad_3rd,
            "iPad3,3": .iPad_3rd,
            "iPad3,4": .iPad_4th,
            "iPad3,5": .iPad_4th,
            "iPad3,6": .iPad_4th,
            "iPad4,1": .iPad_Air,
            "iPad4,2": .iPad_Air,
            "iPad4,3": .iPad_Air,
            "iPad4,4": .iPad_mini_2,
            "iPad4,5": .iPad_mini_2,
            "iPad4,6": .iPad_mini_2,
            "iPad4,7": .iPad_mini_3,
            "iPad4,8": .iPad_mini_3,
            "iPad4,9": .iPad_mini_3,
            "iPad5,1": .iPad_mini_4,
            "iPad5,2": .iPad_mini_4,
            "iPad5,3": .iPad_Air_2,
            "iPad5,4": .iPad_Air_2,
            "iPad6,3": .iPad_Pro_9_7_inch,
            "iPad6,4": .iPad_Pro_9_7_inch,
            "iPad6,7": .iPad_Pro_12_9_inch,
            "iPad6,8": .iPad_Pro_12_9_inch,
            "iPad6,11": .iPad_5th,
            "iPad6,12": .iPad_5th,
            "iPad7,1": .iPad_Pro_12_9_inch_2nd,
            "iPad7,2": .iPad_Pro_12_9_inch_2nd,
            "iPad7,3": .iPad_Pro_10_5_inch,
            "iPad7,4": .iPad_Pro_10_5_inch,
            "iPad7,5": .iPad_6th,
            "iPad7,6": .iPad_6th,
            "iPad7,11": .iPad_7th,
            "iPad7,12": .iPad_7th,
            "iPad8,1": .iPad_Pro_11_inch,
            "iPad8,2": .iPad_Pro_11_inch,
            "iPad8,3": .iPad_Pro_11_inch,
            "iPad8,4": .iPad_Pro_11_inch,
            "iPad8,5": .iPad_Pro_12_9_inch_3rd,
            "iPad8,6": .iPad_Pro_12_9_inch_3rd,
            "iPad8,7": .iPad_Pro_12_9_inch_3rd,
            "iPad8,8": .iPad_Pro_12_9_inch_3rd,
            "iPad8,9": .iPad_Pro_11_inch_2nd,
            "iPad8,10": .iPad_Pro_11_inch_2nd,
            "iPad8,11": .iPad_Pro_12_9_inch_4th,
            "iPad8,12": .iPad_Pro_12_9_inch_4th,
            "iPad11,1": .iPad_mini_5th,
            "iPad11,2": .iPad_mini_5th,
            "iPad11,3": .iPad_Air_3rd,
            "iPad11,4": .iPad_Air_3rd,
            "iPad11,6": .iPad_7th,
            "iPad11,7": .iPad_8th,
            "iPad12,1": .iPad_9th,
            "iPad12,2": .iPad_9th,
            "iPad13,1": .iPad_Air_4th,
            "iPad13,2": .iPad_Air_4th,
            "iPad13,4": .iPad_Pro_11_inch_3rd,
            "iPad13,5": .iPad_Pro_11_inch_3rd,
            "iPad13,6": .iPad_Pro_11_inch_3rd,
            "iPad13,7": .iPad_Pro_11_inch_3rd,
            "iPad13,8": .iPad_Pro_12_9_inch_5th,
            "iPad13,9": .iPad_Pro_12_9_inch_5th,
            "iPad13,10": .iPad_Pro_12_9_inch_5th,
            "iPad13,11": .iPad_Pro_12_9_inch_5th,
            "iPad13,16": .iPad_Air_5th,
            "iPad13,17": .iPad_Air_5th,
            "iPad13,18": .iPad_10th,
            "iPad13,19": .iPad_10th,
            "iPad14,1": .iPad_mini_6th,
            "iPad14,2": .iPad_mini_6th,
            "iPad14,3": .iPad_Pro_11_inch_4rd,
            "iPad14,4": .iPad_Pro_11_inch_4rd,
            "iPad14,5": .iPad_Pro_12_9_inch_6th,
            "iPad14,6": .iPad_Pro_12_9_inch_6th,
            "iPad14,10": .iPad_Air_13_inch_6th,
            "iPad14,11": .iPad_Air_13_inch_6th,
            "iPad15,3": .iPad_Air_11_inch_7th,
            "iPad15,4": .iPad_Air_11_inch_7th,
            "iPad15,5": .iPad_Air_13_inch_7th,
            "iPad15,6": .iPad_Air_13_inch_7th,
            "iPad15,7": .iPad_11th,
            "iPad15,8": .iPad_11th,
            "iPad16,1": .iPad_mini_7th,
            "iPad16,2": .iPad_mini_7th,
            "iPad16,3": .iPad_Pro_11_inch_5th,
            "iPad16,4": .iPad_Pro_11_inch_5th,
            "iPad16,5": .iPad_Pro_13_inch_7th,
            "iPad16,6": .iPad_Pro_13_inch_7th,
            "iPad16,7": .iPad_11th,
            "iPad16,8": .iPad_Air_11_inch_M4,
            "iPad16,9": .iPad_Air_11_inch_M4,
            "iPad16,10": .iPad_Air_13_inch_M4,
            "iPad16,11": .iPad_Air_13_inch_M4,
            "iPad17,1": .iPad_Pro_11_inch_M5,
            "iPad17,2": .iPad_Pro_11_inch_M5,
            "iPad17,3": .iPad_Pro_13_inch_M5,
            "iPad17,4": .iPad_Pro_13_inch_M5,
        ]
        
        return models[identifier]
    }
}
