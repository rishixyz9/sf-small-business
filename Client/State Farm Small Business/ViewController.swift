//
//  ViewController.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.performSegue(withIdentifier: "GoToLogin", sender: self)
        }
        
    }


}

