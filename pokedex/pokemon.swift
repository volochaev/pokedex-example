//
//  pokemon.swift
//  pokedex
//
//  Created by Nikolai Volochaev on 01/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        get {
            return _name
        }
    }
    
    var pokedexId: Int {
        get {
            return _pokedexId
        }
    }
    
    init(name: String, pokedexId: Int) {
        _name = name
        _pokedexId = pokedexId
    }
}