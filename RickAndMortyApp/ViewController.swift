//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by João Paulo de Oliveira Sabino on 18/10/18.
//  Copyright © 2018 João Paulo de Oliveira Sabino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var characters = [Character]()
    var apiManager = APIManager.manager
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "characterCell")
        
        apiManager.fetch { (request) in
            guard let char = request.characters else {return}
            self.characters = char
            self.tableView.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableViewCell
        
        cell.nameLabel?.text = characters[indexPath.row].name

        cell.typeLabel.text = characters[indexPath.row].type
        
        if let image = characters[indexPath.row].image {
            cell.charImageView.downloaded(from: URL(string: image)!)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    
}


