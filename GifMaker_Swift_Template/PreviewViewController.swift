//
//  PreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Ramiro H. Lopez on 1/14/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    var gif: Gif?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageView.image = gif?.gifImage
    }
    
    @IBAction func shareGif() {
        let animatedGif = NSData(contentsOf: (gif?.url)!)
        let shareController = UIActivityViewController(activityItems: [animatedGif!], applicationActivities: nil)
        
        shareController.completionWithItemsHandler = {
            activity, completed, items, error in
            if completed {
                _ = self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        present(shareController, animated: true, completion: nil)
    }
}
