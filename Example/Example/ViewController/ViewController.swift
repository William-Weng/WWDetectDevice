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

    private typealias Info = (type: DeviceType, identifier: String)
    
    private let infos: [Info] = [
        (type: .AppleTV, identifier: "AppleTV6,2"),
        (type: .iPad, identifier: "iPad5,4"),
        (type: .AppleWatch, identifier: "Watch6,9"),
        (type: .iPhone, identifier: UIDevice._identifier()),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let info = WWDetectDevice.shared.deviceInformation(identifier: "iPad13,11")
        wwPrint(info)
    }
    
    /// 檢測裝置類型名稱
    /// - Parameter sender: UIButton
    @IBAction func detectDevice(_ sender: UIButton) {
        
        guard let information = infos[safe: sender.tag] else { return }
        
        let info = WWDetectDevice.shared.deviceInformation(type: information.type, identifier: information.identifier)
        sender.setTitle(info["name"] as? String, for: .normal)
    }
}
