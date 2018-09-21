//
//  TableViewCell.swift
//  MeetUp
//
//  Created by vibha on 2/2/17.
//  Copyright © 2017 vibha. All rights reserved.
//

import UIKit
import AddressBook
import Contacts

class TableViewCell: UITableViewCell {
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactEmailLabel: UILabel!
    @IBOutlet weak var contactPhoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
//    func setCircularAvatar() {
//        contactImageView.layer.cornerRadius = contactImageView.bounds.size.width / 2.0
//        contactImageView.layer.masksToBounds = true
//    }
    
    
    
    func configureWithContactEntry(_ contact: ContactEntry) {
        contactNameLabel.text = contact.name
      //  contactEmailLabel.text = contact.email ?? ""
        contactPhoneLabel.text = contact.phone ?? ""
      //  setCircularAvatar()
    }}
