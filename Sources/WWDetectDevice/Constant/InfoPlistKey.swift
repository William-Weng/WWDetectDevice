//
//  InfoPlistKey.swift
//  WWDetectDevice
//
//  Created by William.Weng on 2026/8/7.
//

import Foundation

/// [info.plist上的Key值](https://ithelp.ithome.com.tw/articles/10206444)
public enum InfoPlistKey: String {

    case CFBundleShortVersionString = "CFBundleShortVersionString"                                              // Version版本號 => 1.0.0
    case CFBundleVersion = "CFBundleVersion"                                                                    // Build的代號 => 202001011
    case CFBundleURLTypes = "CFBundleURLTypes"                                                                  // 可以被其它APP喚起的URLType => [String: Any]
    case CFBundleDevelopmentRegion = "CFBundleDevelopmentRegion"                                                // 設定APP系統文字的語系 (多國語系) => en_US
    case CFBundleAllowMixedLocalizations = "CFBundleAllowMixedLocalizations"                                    // 系統都會盡可能都根據當前的語言進行本地化
    case CFBundleLocalizations = "CFBundleLocalizations"                                                        // 放置多種語言
    case CFBundleName = "CFBundleName"                                                                          // APP的BundleId
    case CFBundleDisplayName = "CFBundleDisplayName"                                                            // 桌面上App的名稱 (多國語系) => Infoplist.strings
    case CFBundleIcons = "CFBundleIcons"                                                                        // 動態ICON使用
    case CFBundleTypeIconFiles = "CFBundleTypeIconFiles"                                                        // 從其他App獲取文件
    case CFBundleAlternateIcons = "CFBundleAlternateIcons"                                                      // 動態ICON使用 (CFBundleIcons => CFBundleAlternateIcons)
    case CFBundleIconFiles = "CFBundleIconFiles"                                                                // 動態ICON使用 (CFBundleAlternateIcons => <icon name> => CFBundleIconFiles)
    case CFBundleDocumentTypes = "CFBundleDocumentTypes"                                                        // 從其他App獲取文件 - 分享 => Document type
    case CFBundleTypeRole = "CFBundleTypeRole"                                                                  // APP的規則 (編譯 / 讀取)
    case CFBundleIdentifier = "CFBundleIdentifier"                                                              // 取得APP BundleId
    
    case LSHandlerRank = "LSHandlerRank"                                                                        // 指定對於某種類型的優先權級別
    case LSItemContentTypes = "LSItemContentTypes"                                                              // 支援的類型 => public.data (UTI)
    case LSSupportsOpeningDocumentsInPlace = "LSSupportsOpeningDocumentsInPlace"                                // iOS設置文件共享 => TRUE - 在App內打開 / FALSE - 拷貝到App
    case LSApplicationQueriesSchemes = "LSApplicationQueriesSchemes"                                            // 可以喚起其它的APP URL Scheme (canOpenURL(_:)) => [String]

    case NSAppleMusicUsageDescription = "NSAppleMusicUsageDescription"                                          // 媒體資料庫
    case NSCalendarsUsageDescription = "NSCalendarsUsageDescription"                                            // 日曆權限
    case NSRemindersUsageDescription = "NSRemindersUsageDescription"                                            // 提醒事項權限
    case NSContactsUsageDescription = "NSContactsUsageDescription"                                              // 通信錄
    case NSMotionUsageDescription = "NSMotionUsageDescription"                                                  // 運動與健身 => 加速度計 (Accelerometer)
    case NSSpeechRecognitionUsageDescription = "NSSpeechRecognitionUsageDescription"                            // 語音識別
    case NSAppTransportSecurity = "NSAppTransportSecurity"                                                      // 網絡訪問的安全性 (ATS) => [String: Any]
    case NSExceptionAllowsInsecureHTTPLoads = "NSExceptionAllowsInsecureHTTPLoads"                              // ATS全部允許 (現在不行用了)
    case NSExceptionMinimumTLSVersion = "NSExceptionMinimumTLSVersion"                                          // [設定TLS最小版本](https://juejin.cn/post/6916505002169237517)
    case NSExceptionDomains = "NSExceptionDomains"                                                              // 針對特定的網域將HTTP內容開放 => [String: Any]
    case NSAllowsArbitraryLoadsInWebContent = "NSAllowsArbitraryLoadsInWebContent"                              // 允許加載任意類型的Web內容 (WKWebView) => true
    case NSAllowsArbitraryLoadsForMedia = "NSAllowsArbitraryLoadsForMedia"                                      // 使用AVFoundation播放的在線影音不受ATS的限制 => true
    case NSPhotoLibraryAddUsageDescription = "NSPhotoLibraryAddUsageDescription"                                // 寫入圖片到相簿 => String
    case NSPhotoLibraryUsageDescription = "NSPhotoLibraryUsageDescription"                                      // 讀取相簿圖片 => String
    case NSCameraUsageDescription = "NSCameraUsageDescription"                                                  // 存取照相機 => String
    case NSFaceIDUsageDescription = "NSFaceIDUsageDescription"                                                  // 使用FaceID => String
    case NSMicrophoneUsageDescription = "NSMicrophoneUsageDescription"                                          // 麥克風權限 (錄音 / 錄影)
    case NSUserTrackingUsageDescription = "NSUserTrackingUsageDescription"                                      // 廣告標識符(Identity for Advertisers) => IDFA
    case NSBluetoothPeripheralUsageDescription = "NSBluetoothPeripheralUsageDescription"                        // 藍牙權限
    case NSLocationUsageDescription = "NSLocationUsageDescription"                                              // 使用者始位置權限
    case NSLocationWhenInUseUsageDescription = "NSLocationWhenInUseUsageDescription"                            // 使用者始終訪問位置 (定位)
    case NSLocationAlwaysAndWhenInUseUsageDescription = "NSLocationAlwaysAndWhenInUseUsageDescription"          // 使用者在使用期間訪問位置 (定位)
    case NSLocationTemporaryUsageDescriptionDictionary = "NSLocationTemporaryUsageDescriptionDictionary"        // 使用者暫時定位 (定位)
    case NSLocationDefaultAccuracyReduced = "NSLocationDefaultAccuracyReduced"                                  // 使用者模糊定位 (定位)
    case NSAppClipRequestEphemeralUserNotification = "NSAppClipRequestEphemeralUserNotification"                // 短暫的推播通知權限 (App Clip)
    case NSAppClipRequestLocationConfirmation = "NSAppClipRequestLocationConfirmation"                          // 短暫的定位權限 (App Clip)
    case NSWidgetWantsLocation = "NSWidgetWantsLocation"                                                        // 在WidgetKit內存取位置
    case NSSiriUsageDescription = "NSSiriUsageDescription"                                                      // 使用Siri權限
    case NSHomeKitUsageDescription = "NSHomeKitUsageDescription"                                                // 使用HomeKit權限
    case NSHealthUpdateUsageDescription = "NSHealthUpdateUsageDescription"                                      // 健康更新
    case NSHealthShareUsageDescription = "NSHealthShareUsageDescription"                                        // 健康分享
    case NSSupportsLiveActivities = "NSSupportsLiveActivities"                                                  // [使用LiveActivity (靈動島)](https://betterprogramming.pub/building-live-activities-for-dynamic-island-in-swift-d76444cb48ab)
    
    case NFCReaderUsageDescription = "NFCReaderUsageDescription"                                                // NFC讀取權限
    
    case ITSAppUsesNonExemptEncryption = "ITSAppUsesNonExemptEncryption"                                        // 建構版本提供出口合規證明資訊 (缺少出口合規資訊)
    
    case PHPhotoLibraryPreventAutomaticLimitedAccessAlert = "PHPhotoLibraryPreventAutomaticLimitedAccessAlert"  // 有限制的照片提示視窗
    
    case UIAppFonts = "UIAppFonts"                                                                              // 外加的字型 => [String]
    case UIMainStoryboardFile = "UIMainStoryboardFile"                                                          // MainStoryboard的檔案名稱 => Main
    case UIFileSharingEnabled = "UIFileSharingEnabled"                                                          // iOS設置iTunes文件共享 => 就是Doucments開放使用
    case UIUserInterfaceStyle = "UIUserInterfaceStyle"                                                          // 黑暗模式 (Dark Mode) => Light / Dark / Unspecified
    case UISupportsDocumentBrowser = "UISupportsDocumentBrowser"                                                // YES - 使用UIDocumentInteractionController
    case UIApplicationExitsOnSuspend = "UIApplicationExitsOnSuspend"                                            // 到背景後重新啟動 (會重新開啟APP) => false
    case UIBackgroundModes = "UIBackgroundModes"                                                                // 延長背景模式運行時間 => [String]
    case UIViewControllerBasedStatusBarAppearance = "UIViewControllerBasedStatusBarAppearance"                  // 設置APP的狀態欄樣式
    
    case UIApplicationShortcutItems = "UIApplicationShortcutItems"                                              // Quick Actions的設定內容 => [[String: Any]]
    case UIApplicationShortcutItemType = "UIApplicationShortcutItemType"                                        // Quick Actions的辨識字串 (必填) => String
    case UIApplicationShortcutItemTitle = "UIApplicationShortcutItemTitle"                                      // Quick Actions的標題字串 (必填) => String
    case UIApplicationShortcutItemSubtitle = "UIApplicationShortcutItemSubtitle"                                // Quick Actions的標題字串 (選填) => String
    case UIApplicationShortcutItemIconType = "UIApplicationShortcutItemIconType"                                // Quick Actions的IconType字串 (選填) => String
    case UIApplicationShortcutItemIconFile = "UIApplicationShortcutItemIconFile"                                // Quick Action的IconFile字串 (選填) => String
    case UIApplicationShortcutItemUserInfo = "UIApplicationShortcutItemUserInfo"                                // Quick Action的更多額外的資訊 (選填) => [String: Any]
    case UIRequiredDeviceCapabilities = "UIRequiredDeviceCapabilities"                                          // 表示符合什麼條件的裝置才能下載 (nfc)
    
    case UIDesignRequiresCompatibility = "UIDesignRequiresCompatibility"                                        // [停用液態玻璃效果](https://juejin.cn/post/7541078964526940210)
    
    case UTExportedTypeDeclarations = "UTExportedTypeDeclarations"                                              // 自訂的UTI => [String: Any]
    case kMDItemKeywords = "kMDItemKeywords"                                                                    // 關鍵字搜尋
}
