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
    var pokemonsArray: [Pokemon]!

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
    @IBOutlet weak var nextPokemonLbl: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var inProgressLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name.capitalized
        let image = UIImage(named: String(pokemon.pokedexId))
        mainImg.image = image
        nextPokemon.image = UIImage(named: "\(pokemon.pokedexId + 1)")
        pokedexIdLbl.text = String(pokemon.pokedexId)
        if pokemon.pokedexId != pokemonsArray.count {
            nextPokemonLbl.text = "Next Pokemon: \(pokemonsArray[pokemon.pokedexId].name.capitalized)"
        } else {
            nextPokemonLbl.text = "No Next Pokemons"
        }
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
    
    @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            for someView in self.view.subviews {
                someView.isHidden = false
                if let stackView = someView as? UIStackView {
                    getView(currentView: stackView)
                }
            }
            inProgressLbl.isHidden = true

        case 1:
            for someView in self.view.subviews {
                if let stackView = someView as? UIStackView {
                    getView(currentView: stackView)
                } else if someView != navigationView {
                    someView.isHidden = true
                }
            }
            inProgressLbl.isHidden = false

        default:
            print("Something goes wrong")
        }
    }
    
    
    func getView(currentView: UIStackView) {
        if currentView.subviews.count != 0 {
            for elem in currentView.subviews {
                if elem is UISegmentedControl {
                    print("UISegmentedControl!!!")
                } else if elem is UIStackView {
                    getView(currentView: elem as! UIStackView)
                } else {
                    if elem.isHidden == true {
                        elem.isHidden = false
                    } else {
                        elem.isHidden = true
                    }
                }
            }
        }
    }
    
    
}
