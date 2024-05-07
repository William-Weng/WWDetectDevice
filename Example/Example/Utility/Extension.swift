//
//  Extension.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit

// MARK: - Collection (override class function)
extension Collection {

    /// [為Array加上安全取值特性 => nil](https://stackoverflow.com/questions/25329186/safe-bounds-checked-array-lookup-in-swift-through-optional-bindings)
    subscript(safe index: Index) -> Element? { return indices.contains(index) ? self[index] : nil }
}

// MARK: - UIDevice (function)
extension UIDevice {
    
    /// [取得iPhone的內部編號 - 實機](https://medium.com/彼得潘的-swift-ios-app-開發教室/get-current-iphone-device-model-取得手機型號資訊-5cee991ace1e)
    /// => iPhone14,5 (iPhone 13)
    /// - Returns: [String](https://www.theiphonewiki.com/wiki/Models)
    static func _identifier() -> String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(Unicode.Scalar(UInt8(value)))
        }
        
        return identifier
    }
}
