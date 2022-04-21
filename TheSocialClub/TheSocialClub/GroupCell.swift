//
//  GroupCell.swift
//  TheSocialClub
//
//  Created by Jasmine Makombe on 4/18/22.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupOwnerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func onAddButton(_ sender: Any) {
    }
    
}

    
