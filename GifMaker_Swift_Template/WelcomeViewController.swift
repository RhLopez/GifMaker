//
//  WelcomeViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Ramiro H. Lopez on 1/14/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let proofOfConceptGif = UIImage.gif(name: "hotlineBling")
        gifImageView.image = proofOfConceptGif
    }
    
}
