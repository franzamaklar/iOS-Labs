//
//  EntryViewController.swift
//  LV1_Zamaklar
//
//  Created by student on 23.04.2022..
//

import UIKit

protocol EntryViewProtocol : AnyObject {
    func newCreated(destination: Destination)
}

class EntryViewController: UIViewController {

    @IBOutlet weak var nazivLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var opisTextField: UITextField!
    @IBOutlet weak var nazivTextField: UITextField!
    @IBOutlet weak var opisLabel: UILabel!
    
    weak var delegate: EntryViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Unos destinacije"
        nazivLabel.text = "Naziv:"
        opisLabel.text = "Opis:"
        saveButton.setTitle("Save", for: UIControl.State.normal)
    }
    
    @IBAction func onTapButton(_ sender: Any) {
        
        guard let naziv = nazivTextField.text, naziv.count > 3 else {
            return
        }
        
        guard let opisL = opisTextField.text, opisL.count > 3 else {
            return
        }
        
        let destination = Destination(ime: naziv, opis: opisL)
        
        delegate?.newCreated(destination: destination)
        
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
