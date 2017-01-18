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
        if (self.view.frame.origin.y >= 0) {
            var rect: CGRect = self.view.frame
            rect.origin.y  -= getKeyboardHeight(notifcation: notification)
            self.view.frame = rect
        }
    }
    
    func keyboardWillHide(notification: Notification) {
        if (self.view.frame.origin.y < 0) {
            var rect: CGRect = self.view.frame
            rect.origin.y += getKeyboardHeight(notifcation: notification)
            self.view.frame = rect
        }
    }
    
    func getKeyboardHeight(notifcation: Notification) -> CGFloat {
        let userInfo: Dictionary = notifcation.userInfo!
        let keyBoardSize = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue
        
        return keyBoardSize.cgRectValue.height
    }
}
