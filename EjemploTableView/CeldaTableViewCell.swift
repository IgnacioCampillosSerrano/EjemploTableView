//
//  CeldaTableViewCell.swift
//  EjemploTableView
//
//  Created by Ignacio Campillos Serrano on 02/11/2023.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var lbContenido: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
