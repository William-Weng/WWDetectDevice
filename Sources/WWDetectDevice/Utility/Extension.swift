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
    func data(using encoding: String.Encoding = .utf8, isLossyConversion: Bool = false) -> Data? {
        let data = self.data(using: encoding, allowLossyConversion: isLossyConversion)
        return data
    }
    
    /// JSON String => JSON Object
    /// - Parameters:
    ///   - encoding: 字元編碼
    ///   - options: JSON序列化讀取方式
    /// - Returns: Any?
    func jsonObject(encoding: String.Encoding = .utf8, options: JSONSerialization.ReadingOptions = .allowFragments) -> Any? {
        
        guard let data = self.data(using: encoding),
              let jsonObject = try? JSONSerialization.jsonObject(with: data, options: options)
        else {
            return nil
        }
        
        return jsonObject
    }
}

// MARK: - Bundle (function)
extension Bundle {
    
    /// 取得APP名稱
    /// - Returns: String?
    var displayName: String? {
        guard let bundleId = infoDictionary(forKey: .CFBundleName) as? String else { return nil }
        return bundleId
    }
    
    /// 取得APP的ID
    /// - Returns: String?
    var appBundleId: String? {
        guard let bundleId = infoDictionary(forKey: .CFBundleIdentifier) as? String else { return nil }
        return bundleId
    }
    
    /// [取得外部版本號 => $(CURRENT_PROJECT_VERSION)](https://www.theswift.dev/posts/easily-keep-build-numbers-and-marketing-versions-in-sync)
    /// - info.plist => Version
    /// - Returns: String?
    var appVersion: String? {
        guard let version = infoDictionary(forKey: .CFBundleShortVersionString) as? String else { return nil }
        return version
    }
    
    /// 取得內部版本號 => $(MARKETING_VERSION)
    /// - info.plist => Build
    /// - Returns: String?
    var appBuildValue: String? {
        guard let build = infoDictionary(forKey: .CFBundleVersion) as? String else { return nil }
        return build
    }
}

// MARK: - Bundle (function)
extension Bundle {
    
    /// 取得外部檔案完整的URL
    /// - LiftCycle.jpeg => ./Documents/LiftCycle.jpeg
    /// - Parameter filename: 檔案名稱
    /// - Returns: URL?
    func fileUrl(with filename: String) -> URL? { return bundleURL.appendingPathComponent(filename) }
    
    /// Bundle File => String
    /// - Parameters:
    ///   - resource: 外部檔案 (scrpit.js)
    ///   - encoding: 字元編碼 (UTF8)
    /// - Returns: String?
    func readText(resource: String, encoding: String.Encoding = .utf8) -> String? {
        
        guard let fileUrl = self.fileUrl(with: "\(resource)"),
              let text = FileManager.default.readText(from: fileUrl, encoding: encoding)
        else {
            return nil
        }

        return text
    }
    
    /// 讀取info.plist的欄位資訊
    /// - CFBundleShortVersionString...
    /// - Parameter key: 要取的Key值
    /// - Returns: Any?
    func infoDictionary(forKey key: InfoPlistKey) -> Any? { return infoDictionary?[key.rawValue] }
}

// MARK: - FileManager (function)
extension FileManager {
    
    /// 讀取檔案文字
    /// - Parameters:
    ///   - url: 文件的URL
    ///   - encoding: 編碼格式
    /// - Returns: String?
    func readText(from url: URL?, encoding: String.Encoding = .utf8) -> String? {
        
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
    static var identifier: String {
        
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
    /// - Returns: [WWDetectDevice.SystemInformation](https://mini.nidbox.com/diary/read/9759417)
    static var systemInformation: SystemInformation {
        .init(name: UIDevice.current.systemName, version: UIDevice.current.systemVersion, model: UIDevice.current.model, idiom: UIDevice.current.userInterfaceIdiom)
    }
    
    /// 快速取得當前應用程式資訊的靜態計算屬性
    static var appInformation: AppInformation {
        let bundle = Bundle.main
        return .init(appName: bundle.displayName, appId: bundle.appBundleId, appVersion: bundle.appVersion, appBuildValue: bundle.appBuildValue)
    }
}
