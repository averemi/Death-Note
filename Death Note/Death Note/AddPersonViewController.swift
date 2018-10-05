//
//  AddPersonViewController.swift
//  Death Note
//
//  Created by Anastasiia VEREMIICHYK on 10/4/18.
//  Copyright © 2018 Anastasiia VEREMIICHYK. All rights reserved.
//

import UIKit

protocol AddPersonDelegate {
    func userAddedPerson (Name: String, Description: String, Date: String)
}


class AddPersonViewController: UIViewController {
    
    var delegate : AddPersonDelegate?
    
    
    @IBOutlet weak var nameAdd: UITextField!
    @IBOutlet weak var dateAdd: UIDatePicker!
    @IBOutlet weak var descriptionAdd: UITextView!
    
    @IBAction func donePressed(_ sender: Any) {
        
        let name = nameAdd.text!
        let date = String(describing: dateAdd.date)
        let description = descriptionAdd.text!
        
        delegate?.userAddedPerson(Name: name, Description: description, Date: date)
        print(name)
        print(date)
        print(description)
        self.dismiss(animated: true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
