//
//  ViewController.swift
//  MeetUp
//
//  Created by vibha on 2/2/17.
//  Copyright © 2017 vibha. All rights reserved.
//

import UIKit
import AddressBook

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet var tblView: UITableView!

    var contacts = [ContactEntry]()
    var rightBarButtonItem : UIBarButtonItem!
    var txtGroupName : UITextField!
    var selectedCell:NSMutableArray = NSMutableArray ()
    var arrData : NSArray = []


       override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rightBarButtonItem = UIBarButtonItem(title: "Make A Group", style:         UIBarButtonItemStyle.plain, target: self, action:  #selector(makeAgroup(sender:)))

        self.txtGroupName = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 100));
        self.view.addSubview(txtGroupName)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // initial appearance
        tblView.isHidden = true
        //noContactsLabel.isHidden = false
        //noContactsLabel.text = "Retrieving contacts..."
        //
        retrieveAddressBookContacts { (success, contacts) in
            self.tblView.isHidden = !success
           // self.noContactsLabel.isHidden = success
            if success && (contacts?.count)! > 0 {
                self.contacts = contacts!
                self.tblView.reloadData()
            } else {
              //  self.noContactsLabel.text = "Unable to get contacts..."
            }
        }
    }
    

    // AddressBook methods
    func retrieveAddressBookContacts(_ completion: @escaping (_ success: Bool, _ contacts: [ContactEntry]?) -> Void) {
        let abAuthStatus = ABAddressBookGetAuthorizationStatus()
        if abAuthStatus == .denied || abAuthStatus == .restricted {
            completion(false, nil)
            return
        }
        
        let addressBookRef = ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()
        
        ABAddressBookRequestAccessWithCompletion(addressBookRef) {
            (granted: Bool, error: CFError?) in
            DispatchQueue.main.async {
                if !granted {
                    self.showAlertMessage("Sorry, you have no permission for accessing the address book contacts.")
                } else {
                    var contacts = [ContactEntry]()
                    let abPeople = ABAddressBookCopyArrayOfAllPeople(addressBookRef).takeRetainedValue() as Array
                    for abPerson in abPeople {
                        if let contact = ContactEntry(addressBookEntry: abPerson) { contacts.append(contact) }
                    }
                    completion(true, contacts)
                }
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //var cell : UITableViewCell?
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let entry = contacts[(indexPath as NSIndexPath).row]
        cell.configureWithContactEntry(entry)
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        
        
        if indexPath.row>1
        {
            self.navigationItem.rightBarButtonItem = self.rightBarButtonItem
        }
        else
        {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    func makeAgroup(sender: UIBarButtonItem)
    {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GroupViewController") as! GroupViewController
        secondViewController.SelectedData = selectedCell
        self.navigationController?.pushViewController(secondViewController, animated: true)

        
        
        self.view.addSubview(txtGroupName)
        
    }

}

