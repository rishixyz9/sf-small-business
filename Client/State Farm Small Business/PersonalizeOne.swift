//
//  PersonalizeOne.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/4/23.
//

import UIKit

class PersonalizeOne: UIViewController {

    @IBOutlet weak var CustomTextInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomTextInput.placeholder = "Enter your business to see if it's covered (example: florist)"
        CustomTextInput.textColor = UIColor.white
    }

}
