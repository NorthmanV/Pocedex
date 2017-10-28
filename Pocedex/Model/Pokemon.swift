//
//  Pokemon.swift
//  Pocedex
//
//  Created by Руслан Акберов on 15.10.2017.
//  Copyright © 2017 Ruslan Akberov. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _abilities: String!
    private var _type: String!
    private var _attack: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var abilities: String {
        if _abilities == nil {
            _abilities = ""
        }
        return _abilities
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var nextEvolutionText: String {
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    init (name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { response in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = String(weight)
                }
                if let height = dict["height"] as? Int {
                    self._height = String(height)
                }
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>]{
                    if let attack = stats[4]["base_stat"] as? Int {
                        self._attack = String(attack)
                    }
                    if let defense = stats[3]["base_stat"] as? Int {
                        self._defense = String(defense)
                    }
                }
                if let types = dict["types"] as? [Dictionary<String, AnyObject>], types.count > 0{
                    for x in 0..<types.count {
                            if let type = types[x]["type"] as? Dictionary<String, AnyObject> {
                                if let name = type["name"] as? String{
                                    if x == 0 {
                                        self._type = name.capitalized
                                    } else {
                                        self._type! += "/\(name.capitalized)"
                                    }
                                }
                            }
                        }
                } else {
                    self._type = "None"
                }
                if let abilities = dict["abilities"] as? [Dictionary<String, AnyObject>], abilities.count > 0 {
                    for x in 0..<abilities.count {
                        if let ability = abilities[x]["ability"] as? Dictionary<String, AnyObject> {
                            if let name = ability["name"] as? String {
                                if x == 0 {
                                    self._abilities = name.capitalized
                                } else {
                                    self._abilities! += ", \(name.capitalized)"
                                }
                            }
                        }
                    }
                }
                }
            completed()
        }
    }
    
    
}
