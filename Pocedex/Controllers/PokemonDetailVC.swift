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
    @IBOutlet weak var abilitiesLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var nextPokemon: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name.capitalized
        let image = UIImage(named: String(pokemon.pokedexId))
        mainImg.image = image
        nextPokemon.image = UIImage(named: "\(pokemon.pokedexId + 1)")
        pokedexIdLbl.text = String(pokemon.pokedexId)
        abilitiesLbl.sizeToFit()
        
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
        abilitiesLbl.text = pokemon.abilities
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
