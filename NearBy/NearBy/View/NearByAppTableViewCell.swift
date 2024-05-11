//
//  NearByAppTableViewCell.swift
//  NearBy
//
//  Created by Akhil Jain on 11/05/24.
//

import UIKit

class NearByAppTableViewCell: UITableViewCell {

    @IBOutlet weak var venueImageView: UIImageView!
    @IBOutlet weak var venueAddressLabel: UILabel!
    @IBOutlet weak var venueNameLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(venue: Venue){
        self.venueNameLable.text = venue.name
        self.venueAddressLabel.text = venue.address
    }
    
    
}
