//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Nikolai Volochaev on 01/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UINavigationItem!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon: Pokemon!
    var activityIndicatorView: ActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        nameLbl.title = pokemon.name.capitalizedString
        let currImg = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = currImg
        currentEvoImg.image = currImg
    
        pokemon.downloadPokemonDetails { () -> () in
            self.updateUI()
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.view.removeFromSuperview()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        activityIndicatorView = ActivityIndicatorView(title: "Processing...", center: self.view.center)
        view.addSubview(self.activityIndicatorView.getViewActivityIndicator())
        
        activityIndicatorView.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUI() {
        descLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenceLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        pokedexLbl.text = "\(pokemon.pokedexId)"
    
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
            
            evoLbl.text = str
        }
    }
}
