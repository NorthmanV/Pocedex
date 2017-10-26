//
//  PokemonDetailVC.swift
//  Pocedex
//
//  Created by Руслан Акберов on 22.10.2017.
//  Copyright © 2017 Ruslan Akberov. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name.capitalized
        let image = UIImage(named: String(pokemon.pokedexId))
        mainImg.image = image
        currentEvoImg.image = image
        pokedexIdLbl.text = String(pokemon.pokedexId)
        
        
        pokemon.downloadPokemonDetails {
            //called after the network call is complete
            self.updateUI()
        }

    }
    func updateUI() {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
