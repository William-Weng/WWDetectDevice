//
//  Extension.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit

// MARK: - String (function)
extension String {
    
    /// String => Data
    /// - Parameters:
    ///   - encoding: 字元編碼
    ///   - isLossyConversion: 失真轉換
    /// - Returns: Data?
    func _data(using encoding: String.Encoding = .utf8, isLossyConversion: Bool = false) -> Data? {
        let data = self.data(using: encoding, allowLossyConversion: isLossyConversion)
        return data
    }
    
    /// JSON String => JSON Object
    /// - Parameters:
    ///   - encoding: 字元編碼
    ///   - options: JSON序列化讀取方式
    /// - Returns: Any?
    func _jsonObject(encoding: String.Encoding = .utf8, options: JSONSerialization.ReadingOptions = .allowFragments) -> Any? {
        
        guard let data = self._data(using: encoding),
              let jsonObject = try? JSONSerialization.jsonObject(with: data, options: options)
        else {
            return nil
        }
        
        return jsonObject
    }
}

// MARK: - Bundle (function)
extension Bundle {
    
    /// 取得外部檔案完整的URL
    /// - LiftCycle.jpeg => ./Documents/LiftCycle.jpeg
    /// - Parameter filename: 檔案名稱
    /// - Returns: URL?
    func _fileUrl(with filename: String) -> URL? { return bundleURL.appendingPathComponent(filename) }
    
    /// Bundle File => String
    /// - Parameters:
    ///   - resource: 外部檔案 (scrpit.js)
    ///   - encoding: 字元編碼 (UTF8)
    /// - Returns: String?
    func _readText(resource: String, encoding: String.Encoding = .utf8) -> String? {
        
        guard let fileUrl = self._fileUrl(with: "\(resource)"),
              let text = FileManager.default._readText(from: fileUrl, encoding: encoding)
        else {
            return nil
        }

        return text
    }
}

// MARK: - FileManager (function)
extension FileManager {
    
    /// 讀取檔案文字
    /// - Parameters:
    ///   - url: 文件的URL
    ///   - encoding: 編碼格式
    /// - Returns: String?
    func _readText(from url: URL?, encoding: String.Encoding = .utf8) -> String? {
        
        guard let url = url,
              let readedText = try? String(contentsOf: url, encoding: encoding)
        else {
            return nil
        }
        
        return readedText
    }
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
    
    /// [取得系統的相關資訊](https://mini.nidbox.com/diary/read/9759417) => (name: "iOS", version: "14.6", model: "iPhone", idiom: 0)
    /// - Returns: [Constant.SystemInformation](https://mini.nidbox.com/diary/read/9759417)
    static func _systemInformation() -> WWDetectDevice.Constant.SystemInformation {
        let info: WWDetectDevice.Constant.SystemInformation = (name: UIDevice.current.systemName, version: UIDevice.current.systemVersion, model: UIDevice.current.model, idiom: UIDevice.current.userInterfaceIdiom)
        return info
    }
}
