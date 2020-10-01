//
//  FirstCell.swift
//  WeatherToday
//
//  Created by sangheon on 2020/10/01.
//

import UIKit

class FirstCell:UITableViewCell {
    
    @IBOutlet var countryImage:UIImageView!
    @IBOutlet var countryLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
