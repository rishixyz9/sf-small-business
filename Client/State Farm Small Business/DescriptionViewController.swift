//
//  DescriptionViewController.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/5/23.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextField.placeholder = "Enter a brief description of your business"
        descriptionTextField.textColor = UIColor.white
    }

}
