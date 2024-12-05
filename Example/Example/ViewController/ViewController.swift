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

    private typealias Info = (type: WWDetectDevice.Constant.DeviceType, identifier: String)
    
    private let identifiers: [String] = [
        "AppleTV6,2",
        "iPad5,4",
        "Watch6,9",
        WWDetectDevice.shared.deviceIdentifier(),
    ]
    
    /// 檢測裝置類型名稱
    /// - Parameter sender: UIButton
    @IBAction func detectDevice(_ sender: UIButton) {
        
        guard let identifier = identifiers[safe: sender.tag],
              let name = WWDetectDevice.shared.deviceInformation(identifier: identifier)["name"] as? String
        else {
            return
        }
        
        sender.setTitle(name, for: .normal)
        printType(identifier: identifier)
    }
    
    /// 檢測裝置系統名稱
    /// - Parameter sender: UIButton
    @IBAction func detectOS(_ sender: UIButton) {
        let os = "\(WWDetectDevice.shared.deviceSystemInformation().name) \(WWDetectDevice.shared.deviceSystemInformation().version)"
        sender.setTitle(os, for: .normal)
    }
    
    /// 列印出enum
    /// - Parameters:
    ///   - identifier: 裝置編號
    private func printType(identifier: String) {
        
        guard let type = WWDetectDevice.Constant.DeviceType.find(with: identifier) else { return }
        
        switch type {
        case .iPhone: let type = WWDetectDevice.Constant.iPhoneType.find(with: identifier); wwPrint(type)
        case .iPad: let type = WWDetectDevice.Constant.iPadType.find(with: identifier); wwPrint(type)
        case .AppleWatch: let type = WWDetectDevice.Constant.AppleWatchType.find(with: identifier); wwPrint(type)
        case .AppleTV: let type = WWDetectDevice.Constant.AppleTVType.find(with: identifier); wwPrint(type)
        }
    }
}
