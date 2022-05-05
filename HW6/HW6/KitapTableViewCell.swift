//
//  KitapTableViewCell.swift
//  HW6
//
//  Created by Irmak Zenger on 5/5/22.
//
/*
 Kaynaklar
 https://www.hackingwithswift.com/example-code/calayer/how-to-add-a-border-outline-color-to-a-uiview
 */

import UIKit

class KitapTableViewCell: UITableViewCell {

    @IBOutlet weak var kitapKapakImageView: UIImageView!
    
    @IBOutlet weak var kitapAdLabel: UILabel!
    
    
    @IBOutlet weak var kitapYazarLabel: UILabel!
    
    @IBOutlet weak var kategoriLabel: UILabel!
    
    
    @IBOutlet weak var internalView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        internalView.layer.borderWidth = 1
        internalView.layer.borderColor = UIColor(named: "cell_border_color")?.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
