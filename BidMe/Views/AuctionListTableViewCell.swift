//
//  AuctionListTableViewCell.swift
//  BidMe
//
//  Created by Xiaoxiao Li on 12/7/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit

class AuctionListTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var itemImage: UIImageView!
   
    @IBOutlet weak var itemTitle: UILabel!
    
    @IBOutlet weak var itemBasePrice: UILabel!
    
    @IBOutlet weak var itemCurrentPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
