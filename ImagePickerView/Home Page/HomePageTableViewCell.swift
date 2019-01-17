//
//  HomePageTableViewCell.swift
//  ImagePickerView
//
//  Created by Ron Yi on 2019/1/17.
//  Copyright © 2019 Ron Yi. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
