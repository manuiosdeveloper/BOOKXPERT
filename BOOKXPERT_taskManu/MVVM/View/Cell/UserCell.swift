//
//  UserCell.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 06/04/25.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userNmeLabel: UILabel!
    @IBOutlet weak var id_Label: UILabel!
    
    @IBOutlet weak var Nickname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
