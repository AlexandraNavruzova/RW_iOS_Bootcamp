//
//  AboutViewController.swift
//  ColorGame
//
//  Created by Александра Наврузова on 31.05.2020.
//  Copyright © 2020 Alexandra Navruzova. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "RGB", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func close() {
         dismiss(animated: true, completion: nil)
     }
}

