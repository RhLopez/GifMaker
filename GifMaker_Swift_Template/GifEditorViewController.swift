//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Ramiro H. Lopez on 1/14/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    var gif: Gif?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gifImageView.image = gif?.gifImage
        subscribeToKeyboardNotification()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionTextField.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotification()
    }
    
    @IBAction func presentPreview() {
        let regift = Regift(sourceFileURL: (self.gif?.videoURL)!, destinationFileURL: nil, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        let gifURL = regift.createGif(caption: captionTextField.text, font: captionTextField.font)
        let gif = Gif(url: gifURL!, videoURL: (self.gif?.videoURL)!, caption: captionTextField.text)
        
        let gifPreviewVC = storyboard?.instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        gifPreviewVC.gif = gif
        navigationController?.pushViewController(gifPreviewVC, animated: true)
    }
}

extension GifEditorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
    }
}

extension GifEditorViewController {
    func subscribeToKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotification() {
        NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillShow)
        NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillHide)
    }
    
    func keyboardWillShow(notification: Notification) {
        if view.frame.origin.y >= 0 {
            var rect: CGRect = self.view.frame
            rect.origin.y  -= getKeyboardHeight(notifcation: notification)
            self.view.frame = rect
        }
    }
    
    func keyboardWillHide(notification: Notification) {
        if view.frame.origin.y < 0 {
            var rect: CGRect = self.view.frame
            rect.origin.y += getKeyboardHeight(notifcation: notification)
            self.view.frame = rect
        }
    }
    
    func getKeyboardHeight(notifcation: Notification) -> CGFloat {
        let userInfo = notifcation.userInfo
        let keyBoardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        
        return keyBoardSize.cgRectValue.height
    }
}
