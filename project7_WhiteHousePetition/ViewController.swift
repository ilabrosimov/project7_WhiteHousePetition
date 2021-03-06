//
//  ViewController.swift
//  project7_WhiteHousePetition
//
//  Created by Ilia Abrosimov on 07.07.2022.
//

import UIKit

class ViewController: UITableViewController {
 var petitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        if let url = URL (string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(jsonData: data)
            }
        }
        
      
        
    }
    func parse(jsonData: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: jsonData) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.detailPetition = petitions[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

