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
     //   let date = String(describing: dateAdd.date)
        
        let dateFormatter = DateFormatter()//3
        
        let theDateFormat = DateFormatter.Style.short //5
        let theTimeFormat = DateFormatter.Style.short//6
        
        dateFormatter.dateStyle = theDateFormat//8
        dateFormatter.timeStyle = theTimeFormat//9
        
        let date = dateFormatter.string(from: dateAdd.date)//11
      //  let date = dateFormatter
        let description = descriptionAdd.text!
        
        print("Name: \(name)")
        print("Date: \(date)")
        print("Description: \(description)")
        
        delegate?.userAddedPerson(Name: name, Description: description, Date: date)
        
        navigationController?.popViewController(animated: true)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionAdd.layer.borderWidth = 1
        descriptionAdd.layer.borderColor = UIColor.black.cgColor
        
        let currentDate = NSDate()  //5 -  get the current date
        dateAdd.minimumDate = currentDate as Date  //6- set the current date/time as a minimum
        dateAdd.date = currentDate as Date //7 - defaults to current time but shows how to use it.
        
        

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
