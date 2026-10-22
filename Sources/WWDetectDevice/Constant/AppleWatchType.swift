//
//  AppleWatchType.swift
//  WWDetectDevice
//
//  Created by William.Weng on 2026/8/7.
//

import Foundation

// MARK: - AppleWatch在販售時的名字
enum AppleWatchType: DeviceEnum, CaseIterable {
    
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
    case Apple_Watch_Ultra_3
    case Apple_Watch_SE_3rd
    case Apple_Watch_Series_11
    case Apple_Watch_Ultra_4
    case Apple_Watch_Series_12

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
            "Watch7,12": .Apple_Watch_Ultra_3,
            "Watch7,13": .Apple_Watch_SE_3rd,
            "Watch7,14": .Apple_Watch_SE_3rd,
            "Watch7,15": .Apple_Watch_SE_3rd,
            "Watch7,16": .Apple_Watch_SE_3rd,
            "Watch7,17": .Apple_Watch_Series_11,
            "Watch7,18": .Apple_Watch_Series_11,
            "Watch7,19": .Apple_Watch_Series_11,
            "Watch7,20": .Apple_Watch_Series_11,
            "Watch8,1": .Apple_Watch_Ultra_4,
            "Watch8,2": .Apple_Watch_Series_12,
            "Watch8,3": .Apple_Watch_Series_12,
            "Watch8,4": .Apple_Watch_Series_12,
            "Watch8,5": .Apple_Watch_Series_12,
        ]
        
        return models[identifier]
    }
}
