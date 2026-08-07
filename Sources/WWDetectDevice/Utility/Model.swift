//
//  File.swift
//  WWDetectDevice
//
//  Created by iOS on 2026/8/7.
//

import UIKit // 必須匯入 UIKit 才能使用 UIUserInterfaceIdiom

/// 儲存裝置系統與硬體資訊的資料結構（可供外部模組存取）
public struct SystemInformation {
    
    /// 作業系統的名稱（例如："iOS"、"iPadOS"）
    public let name: String
    
    /// 作業系統的版本號（例如："17.5"、"18.0"）
    public let version: String
    
    /// 裝置的具體型號名稱（例如："iPhone 15 Pro" 或硬體代號 "iPhone16,1"）
    public let model: String
    
    /// 裝置的介面型態（例如：.phone 手機、.pad 平板、.mac 電腦），常用於判斷畫面佈局
    public let idiom: UIUserInterfaceIdiom
}

/// 儲存應用程式基本資訊的資料結構
public struct AppInformation {
    
    /// 應用程式的名稱（例如："MyAwesomeApp"）
    /// 使用 Optional (String?) 是因為名稱在初始設定前可能為空值
    public let appName: String?
    
    /// 應用程式的唯一識別碼（Bundle Identifier，例如："com.company.myapp"）
    public let appId: String?
    
    /// 應用程式的面向大眾的版本號（Marketing Version，例如："1.0.2"）
    public let appVersion: String?
    
    /// 應用程式內部的建置版本號（Build Number，例如："20260807" 或 "12"）
    /// 通常用於開發團隊內部追蹤或提交 App Store 審查時的版本區隔
    public let appBuildValue: String?
}
