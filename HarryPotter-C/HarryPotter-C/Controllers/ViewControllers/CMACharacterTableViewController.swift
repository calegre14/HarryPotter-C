//
//  CMACharacterTableViewController.swift
//  HarryPotter-C
//
//  Created by Christopher Alegre on 10/8/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class CMACharacterTableViewController: UITableViewController {
    var characters: [CMACharacter] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        CMACharacterController.fetchCharater { (characters) in
            DispatchQueue.main.async {
                self.characters = characters
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "potterCell", for: indexPath) as? CMACharacterTableViewCell else {return UITableViewCell()}
        let character = characters[indexPath.row]
        cell.updateViews(with: character)
        return cell
    }

}
