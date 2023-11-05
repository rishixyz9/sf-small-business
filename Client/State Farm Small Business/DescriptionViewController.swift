//
//  DescriptionViewController.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/5/23.
//

import UIKit

struct apiStuff {
    static var value: String? = ""
}

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    
    var storedText: String = ""
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let message = descriptionTextField.text, !message.isEmpty {
            print(message)
                    performSegue(withIdentifier: "segueToSecondVC", sender: message)
                } else {
                    // Handle empty message input
                    print("Message cannot be empty")
                }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "segueToSecondVC", let message = sender as? String {
                if let destinationVC = segue.destination as? PersonalizedRecommendationsViewController,
                let message = sender as? String {
                    destinationVC.receivedMessage = message
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextField.placeholder = "Enter a brief description of your business"
        descriptionTextField.textColor = UIColor.white
        
        // Assign the text field's text to the storedText property when the view loads
        apiStuff.value = descriptionTextField.text ?? ""
    }
    
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        // Update the storedText property when the text field's text changes
        apiStuff.value = sender.text ?? ""
    }

}
