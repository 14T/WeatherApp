//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    
    
    var viewModel : CityViewModel?{
        didSet{
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateViews() {
        DispatchQueue.main.async {
            self.nameLabel.text = self.viewModel?.city
            self.regionLabel.text = self.viewModel?.region
            self.countryLabel.text = self.viewModel?.country

        }
        
       
    }
    
}
