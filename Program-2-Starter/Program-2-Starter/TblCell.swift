//
//  TblCell.swift
//  Program-2-Starter
//
//  Created by Sampath kumar Manne on 5/5/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class TblCell: UITableViewCell {

    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var colorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
