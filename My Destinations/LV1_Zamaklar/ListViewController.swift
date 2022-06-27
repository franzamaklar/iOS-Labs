//
//  ViewController.swift
//  LV1_Zamaklar
//
//  Created by student on 23.04.2022..
//

import UIKit

class ListViewController: UIViewController, EntryViewProtocol, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destination.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        let dest = destination[indexPath.row]
        cell.textLabel?.text = dest.ime
        cell.detailTextLabel?.text = dest.opis
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var destination:[Destination] = []
    
    func newCreated(destination: Destination) {
        self.destination.append(destination)
        tableView.reloadData()
        
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(destination)
            UserDefaults.standard.setValue(data, forKey: "Moje_destinacije")
            UserDefaults.standard.synchronize()
        }catch{
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let decoder = JSONDecoder()
        do{
            guard let data: Data = UserDefaults.standard.data(forKey: "Moje_destinacije") else {
                return
            }
            let dataE = try decoder.decode([Destination].self, from: data)
            destination = dataE
        }catch{
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? EntryViewController {
            viewController.delegate = self
        }
    }
}

