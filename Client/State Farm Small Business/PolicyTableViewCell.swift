//
//  PolicyTableViewCell.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/5/23.
//

import UIKit

class PolicyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func commonInit(_ image:String) {
        customImageView.image = UIImage(named: image)
    }
    
}
