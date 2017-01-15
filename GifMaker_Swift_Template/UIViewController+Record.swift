//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Ramiro H. Lopez on 1/15/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

extension UIViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func launchVideoCamera(sender: AnyObject) {
        let recordVideoController = UIImagePickerController()
        recordVideoController.sourceType = .camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.delegate = self
        
        present(recordVideoController, animated: true, completion: nil)
    }
}
