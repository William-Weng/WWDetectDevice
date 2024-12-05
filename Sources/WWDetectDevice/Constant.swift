//
//  Constant.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit

// MARK: - typealias
public extension WWDetectDevice.Constant {
    typealias SystemInformation = (name: String, version: String, model: String, idiom: UIUserInterfaceIdiom)   // 系統資訊 => (iOS, 12.1, iPhone, 0)
}

// MARK: - enum
public extension WWDetectDevice.Constant {
    
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
            
            for type in DeviceType.allCases {
                if (identifier.contains(type.prefix())) { return type }
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
        
    // MARK: - iPhone在販售時的名字
    enum iPhoneType: CaseIterable {
        
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
            ]
            
            return models[identifier]
        }
    }
    
    // MARK: - iPad在販售時的名字
    enum iPadType: CaseIterable {
        
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
            ]
            
            return models[identifier]
        }
    }
    
    // MARK: - AppleWatch在販售時的名字
    enum AppleWatchType: CaseIterable {
        
        case Apple_Watch
        case Apple_Watch_Series
        case Apple_Watch_Series_2
        case Apple_Watch_Series_3
        case Apple_Watch_Series_4
        case Apple_Watch_Series_5
        case Apple_Watch_SE
        case Apple_Watch_Series_6
        case Apple_Watch_Series_7
        case Apple_Watch_SE_2nd
        case Apple_Watch_Series_8
        case Apple_Watch_Ultra
        case Apple_Watch_Series_9
        case Apple_Watch_Ultra_2
        case Apple_Watch_Series_10
        
        /// 使用內建Id去取得該AppleWatch的名稱 ("Watch6,9" => .Apple_Watch_Series_7)
        /// - Parameter identifier: String
        /// - Returns: iPhoneType?
        static public func find(with identifier: String) -> AppleWatchType? {
            
            let models: [String: AppleWatchType] = [
                "Watch1,1": .Apple_Watch,
                "Watch1,2": .Apple_Watch,
                "Watch2,6": .Apple_Watch_Series,
                "Watch2,7": .Apple_Watch_Series,
                "Watch2,3": .Apple_Watch_Series_2,
                "Watch2,4": .Apple_Watch_Series_2,
                "Watch3,1": .Apple_Watch_Series_3,
                "Watch3,2": .Apple_Watch_Series_3,
                "Watch3,3": .Apple_Watch_Series_3,
                "Watch3,4": .Apple_Watch_Series_3,
                "Watch4,1": .Apple_Watch_Series_4,
                "Watch4,2": .Apple_Watch_Series_4,
                "Watch4,3": .Apple_Watch_Series_4,
                "Watch4,4": .Apple_Watch_Series_4,
                "Watch5,1": .Apple_Watch_Series_5,
                "Watch5,2": .Apple_Watch_Series_5,
                "Watch5,3": .Apple_Watch_Series_5,
                "Watch5,4": .Apple_Watch_Series_5,
                "Watch5,9": .Apple_Watch_SE,
                "Watch5,10": .Apple_Watch_SE,
                "Watch5,11": .Apple_Watch_SE,
                "Watch5,12": .Apple_Watch_SE,
                "Watch6,1": .Apple_Watch_Series_6,
                "Watch6,2": .Apple_Watch_Series_6,
                "Watch6,3": .Apple_Watch_Series_6,
                "Watch6,4": .Apple_Watch_Series_6,
                "Watch6,6": .Apple_Watch_Series_7,
                "Watch6,7": .Apple_Watch_Series_7,
                "Watch6,8": .Apple_Watch_Series_7,
                "Watch6,9": .Apple_Watch_Series_7,
                "Watch6,10": .Apple_Watch_SE_2nd,
                "Watch6,11": .Apple_Watch_SE_2nd,
                "Watch6,12": .Apple_Watch_SE_2nd,
                "Watch6,13": .Apple_Watch_SE_2nd,
                "Watch6,14": .Apple_Watch_Series_8,
                "Watch6,15": .Apple_Watch_Series_8,
                "Watch6,16": .Apple_Watch_Series_8,
                "Watch6,17": .Apple_Watch_Series_8,
                "Watch6,18": .Apple_Watch_Ultra,
                "Watch7,1": .Apple_Watch_Series_9,
                "Watch7,2": .Apple_Watch_Series_9,
                "Watch7,3": .Apple_Watch_Series_9,
                "Watch7,4": .Apple_Watch_Series_9,
                "Watch7,5": .Apple_Watch_Ultra_2,
                "Watch7,8": .Apple_Watch_Series_10,
                "Watch7,9": .Apple_Watch_Series_10,
                "Watch7,10": .Apple_Watch_Series_10,
                "Watch7,11": .Apple_Watch_Series_10,
            ]
            
            return models[identifier]
        }
    }
    
    // MARK: - AppleTV在販售時的名字
    enum AppleTVType: CaseIterable {
        
        case AppleTV_1st
        case AppleTV_2nd
        case AppleTV_3rd
        case AppleTV_4th
        case AppleTV_4K
        case AppleTV_4K_2nd
        
        /// 使用內建Id去取得該AppleTV的名稱 ("AppleTV6,2" => .AppleTV_4K)
        /// - Parameter identifier: String
        /// - Returns: iPhoneType?
        static public func find(with identifier: String) -> AppleTVType? {
            
            let models: [String: AppleTVType] = [
                "AppleTV1,1": .AppleTV_1st,
                "AppleTV2,1": .AppleTV_2nd,
                "AppleTV3,1": .AppleTV_3rd,
                "AppleTV3,2": .AppleTV_3rd,
                "AppleTV5,3": .AppleTV_4th,
                "AppleTV6,2": .AppleTV_4K,
                "AppleTV11,1": .AppleTV_4K_2nd
            ]
            
            return models[identifier]
        }
    }
}

