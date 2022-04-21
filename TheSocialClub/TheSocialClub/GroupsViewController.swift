//
//  GroupsViewController.swift
//  TheSocialClub
//
//  Created by Nubia Johnson on 4/20/22.
//

import UIKit
import Parse

class GroupsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var groups = [PFObject]()

   
    
    
    @IBAction func newGroup(_ sender: Any) {
        performSegue(withIdentifier: "newGroup", sender: nil)
    }
    
    // MARK: - Table view data source
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupCell
        
        let group = groups[indexPath.row]
        
        let owner = group["owner"] as! PFUser
        cell.groupOwnerLabel.text = owner.username
        cell.groupNameLabel.text = group["groupname"] as? String
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let query = PFQuery(className: "Groups")
        query.includeKey("owner")
        query.limit = 20
        
        query.findObjectsInBackground { groups, Error in
            if groups != nil{
                self.groups = groups!
                super.viewDidAppear(animated)
                //tableView.reloadData()
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
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
