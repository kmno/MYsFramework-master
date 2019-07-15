//
//  MYsLargeHDCTableViewCell.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 3/22/18.
//  Copyright © 2018 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsLargeHDCTableViewCell: UITableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblTitle: MYsDefaultLable!
    @IBOutlet weak var lblDetails: MYsDefaultLable!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
