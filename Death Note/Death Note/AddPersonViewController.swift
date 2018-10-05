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
        
        if let name = nameAdd.text, !name.isEmpty {

            let description = descriptionAdd.text ?? ""
            
            let dateFormatter = DateFormatter()
            let theDateFormat = DateFormatter.Style.short
            let theTimeFormat = DateFormatter.Style.short
            dateFormatter.dateStyle = theDateFormat
            dateFormatter.timeStyle = theTimeFormat
            let date = dateFormatter.string(from: dateAdd.date)
            
            print("Name: \(String(describing: name))")
            print("Date: \(date)")
            print("Description: \(description)")
            
            delegate?.userAddedPerson(Name: name, Description: description, Date: date)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameAdd.placeholder = "Name"
        
        descriptionAdd.layer.borderWidth = 1
        descriptionAdd.layer.borderColor = UIColor.black.cgColor
        
        let currentDate = NSDate()
        dateAdd.minimumDate = currentDate as Date
        dateAdd.date = currentDate as Date
        
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
