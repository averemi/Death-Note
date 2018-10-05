//
//  ViewController.swift
//  Death Note
//
//  Created by Anastasiia VEREMIICHYK on 10/3/18.
//  Copyright © 2018 Anastasiia VEREMIICHYK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddPersonDelegate {

    @IBOutlet weak var displayNotes: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.deathInfo.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deathInfoCell") as! DeathInfoTableViewCell
        cell.info = Data.deathInfo[indexPath.row]
        cell.nameLabel?.numberOfLines = 0
        cell.deathDescriptionLabel?.numberOfLines = 0
        cell.dataLabel?.numberOfLines = 0
        displayNotes.rowHeight = UITableViewAutomaticDimension
        displayNotes.estimatedRowHeight = 44.0
        
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
   //     cell.textLabel?.text = Data.deathInfo
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addPerson" {
            
            let destinationVC = segue.destination as! AddPersonViewController
            
            destinationVC.delegate = self
            
        }
    }

    func userAddedPerson(Name: String, Description: String, Date: String) {
        let newDeath: (String, String, String) = (Name, Description, Date)
        Data.deathInfo.append(newDeath)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

