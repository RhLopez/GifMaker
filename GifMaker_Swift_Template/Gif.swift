//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Ramiro H. Lopez on 1/16/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class Gif {
    let url: URL
    let videoURL: URL
    let caption: String?
    let gifImage: UIImage?
    var gifData: Data?
    
    init(url: URL, videoURL: URL, caption: String?) {
        self.url = url
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gif(url: url.absoluteString)!
        self.gifData = nil
    }
}
