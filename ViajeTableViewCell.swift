//
//  ViajeTableViewCell.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit

class ViajeTableViewCell: UITableViewCell {

    @IBOutlet weak var Titulo: UILabel!
    @IBOutlet weak var Subtitulo: UILabel!
    @IBOutlet weak var Cuerpo: UILabel!
    @IBOutlet weak var Lugares: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
