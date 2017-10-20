//
//  PokeCell.swift
//  Pocedex
//
//  Created by Руслан Акберов on 15.10.2017.
//  Copyright © 2017 Ruslan Akberov. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        thumbImg.image = UIImage(named: String(self.pokemon.pokedexId))
        nameLbl.text = self.pokemon.name.capitalized
    }
    
    
}
