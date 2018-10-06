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
        return Data.deathInfo.count
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        displayNotes.backgroundView = nil
        displayNotes.backgroundColor = UIColor.clear
        displayNotes.separatorColor = displayNotes.backgroundColor
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deathInfoCell") as! DeathInfoTableViewCell
        cell.info = Data.deathInfo[indexPath.section]
        cell.nameLabel?.numberOfLines = 0
        cell.deathDescriptionLabel?.numberOfLines = 0
        cell.dataLabel?.numberOfLines = 0
        displayNotes.rowHeight = UITableView.automaticDimension
        displayNotes.estimatedRowHeight = 44.0
        
        cell.backgroundColor = UIColor(patternImage: UIImage(named: "paper.jpg")!)
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
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
        refreshTable()
    }
    
    func refreshTable() {
        
        displayNotes.reloadData()
        
    }
    
    
    
    override func viewDidLoad() {
    //    displayNotes.backgroundView?.backgroundColor = UIColor.black
  //      self.navigationController?.navigationBar.isTranslucent = true
    //    self.navigationController?.view.backgroundColor = .clear
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

