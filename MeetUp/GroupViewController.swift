//
//  GroupViewController.swift
//  MeetUp
//
//  Created by vibha on 2/3/17.
//  Copyright © 2017 vibha. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {
    var SelectedData:NSMutableArray = NSMutableArray ()

    @IBOutlet var detailTblView: UITableView!
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
