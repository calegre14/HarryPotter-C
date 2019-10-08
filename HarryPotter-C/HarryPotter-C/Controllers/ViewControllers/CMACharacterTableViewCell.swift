//
//  CMACharacterTableViewCell.swift
//  HarryPotter-C
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class CMACharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterRoleLabel: UILabel!
    @IBOutlet weak var characterHouseImage: UIImageView!
    @IBOutlet weak var characterBloodStatus: UIImageView!
    @IBOutlet weak var characterDeathEaterImage: UIImageView!
    
    func updateViews(with character: CMACharacter) {
        
        if character.deathEater == true {
            characterDeathEaterImage.isHidden = false
        }
        if character.bloodStatus != "unknown" {
            characterBloodStatus.isHidden = false
            characterBloodStatus.image = UIImage.init(named: character.bloodStatus)
        }
        if let house = character.house {
            characterHouseImage.isHidden = false
            characterHouseImage.image = UIImage.init(named: house.lowercased())
        }
        
        characterNameLabel.text = character.name
        characterRoleLabel.text = character.role
    }
}
