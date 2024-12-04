//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/5/7.
//

import UIKit
import WWPrint
import WWDetectDevice

// MARK: - ViewController
final class ViewController: UIViewController {

    private typealias Info = (type: Constant.DeviceType, identifier: String)
    
    private let identifiers: [String] = [
        "AppleTV6,2",
        "iPad5,4",
        "Watch6,9",
        WWDetectDevice.shared.deviceIdentifier(),
    ]
    
    /// 檢測裝置類型名稱
    /// - Parameter sender: UIButton
    @IBAction func detectDevice(_ sender: UIButton) {
        
        guard let identifier = identifiers[safe: sender.tag] else { return }
        
        let info = WWDetectDevice.shared.deviceInformation(identifier: identifier)
        sender.setTitle(info["name"] as? String, for: .normal)
    }
    
    /// 檢測裝置系統名稱
    /// - Parameter sender: UIButton
    @IBAction func detectOS(_ sender: UIButton) {
        let os = "\(WWDetectDevice.shared.deviceSystemInformation().name) \(WWDetectDevice.shared.deviceSystemInformation().version)"
        sender.setTitle(os, for: .normal)
    }
}
