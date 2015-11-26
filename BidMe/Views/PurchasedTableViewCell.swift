//
//  HistoryTableViewCell.swift
//  BidMe
//
//  Created by xiaoxiao li on 11/22/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit

class PurchasedTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var productPic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
