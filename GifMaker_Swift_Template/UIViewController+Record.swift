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

// Regift constans
let frameCount = 16
let delayTime: Float = 0.2
let loopCount = 0 // 0 means loop forever

extension UIViewController {
    @IBAction func launchVideoCamera(sender: AnyObject) {
        let recordVideoController = UIImagePickerController()
        recordVideoController.sourceType = .camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.delegate = self
        
        present(recordVideoController, animated: true, completion: nil)
    }
}

extension UIViewController: UINavigationControllerDelegate {}

extension UIViewController: UIImagePickerControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == kUTTypeMovie as String {
            let videoURL = info[UIImagePickerControllerMediaURL] as! NSURL
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path!, nil, nil, nil)
            dismiss(animated: true, completion: nil)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
