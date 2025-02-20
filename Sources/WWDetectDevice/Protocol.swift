//
//  Protocol.swift
//  WWDetectDevice
//
//  Created by William.Weng on 2025/2/20.
//

import Foundation

// MARK: - 共同的基礎類型
public protocol DeviceEnum {
    
    associatedtype DeviceName
    
    /// [用Id找出Enum](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/幫助-protocol-實現型別代號的-associated-type-44cb2d25952e)
    /// - Parameter identifier: String
    /// - Returns: DeviceName?
    static func find(with identifier: String) -> DeviceName?
}
