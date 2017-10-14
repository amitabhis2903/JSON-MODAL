//
//  ViewController.swift
//  news_json
//
//  Created by Ammy Pandey on 14/10/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func Show(_ sender: UIButton) {
        performSegue(withIdentifier: "show", sender: sender)
    }
    
 
}

