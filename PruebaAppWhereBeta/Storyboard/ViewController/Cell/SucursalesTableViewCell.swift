//
//  SucursalesTableViewCell.swift
//  PruebaAppWhereBeta
//
//  Created by Xookyn on 27/02/20.
//  Copyright © 2020 kenneth. All rights reserved.
//

import UIKit

class SucursalesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sucursalLabel: UILabel!
    
    @IBOutlet weak var direccionLabel: UILabel!
    
    @IBOutlet weak var telefonoLabel: UILabel!
    
    @IBOutlet weak var sucursalImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
