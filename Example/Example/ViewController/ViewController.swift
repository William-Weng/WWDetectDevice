//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/5/7.
//

import UIKit
import WWDetectDevice

// MARK: - ViewController
final class ViewController: UIViewController {
    
    private typealias Info = (type: DeviceType, identifier: String)
    
    private let identifiers: [String] = [
        "AppleTV6,2",
        "iPad5,4",
        "Watch6,9",
        WWDetectDevice.deviceIdentifier,
    ]
    
    /// 檢測裝置類型名稱
    /// - Parameter sender: UIButton
    @IBAction func detectDevice(_ sender: UIButton) {
        
        guard let identifier = identifiers[safe: sender.tag],
              let deviceEnum = WWDetectDevice.deviceEnum(identifier: identifier),
              let name = WWDetectDevice.deviceInformation(identifier: identifier)["name"] as? String
        else {
            return
        }
        
        sender.setTitle(name, for: .normal)
        print(deviceEnum)
    }
    
    /// 檢測裝置系統名稱
    /// - Parameter sender: UIButton
    @IBAction func detectOS(_ sender: UIButton) {
        let os = "\(WWDetectDevice.deviceSystemInformation.name) \(WWDetectDevice.deviceSystemInformation.version)"
        sender.setTitle(os, for: .normal)
        
        
        print(WWDetectDevice.appInformation)
    }
}
