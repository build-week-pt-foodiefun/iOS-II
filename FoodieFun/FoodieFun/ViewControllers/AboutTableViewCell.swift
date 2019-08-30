//
//  AboutTableViewCell.swift
//  FoodieFun
//
//  Created by Enayatullah Naseri on 8/28/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    var aboutDev: AboutDev? {
        didSet{
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var devLable: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateViews() {
        guard let aboutDev = aboutDev else {return}
        
        imageOutlet.image = aboutDev.image
        nameLable.text = aboutDev.devName
        devLable.text = aboutDev.devTitle
        
    }

}
