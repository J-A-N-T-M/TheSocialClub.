//
//  HomeTableViewController.swift
//  TheSocialClub
//
//  Created by Jasmine Makombe on 4/11/22.
//

import UIKit
import Parse

class HomeTableViewController: UITableViewController {
    
    var posts = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCellTableViewCell
        
        let post = posts[indexPath.row]
        
        let user = post["user"] as! PFUser
        cell.usernameLabel.text = user.username
        cell.groupNameLabel.text = "Group"
        
        cell.postContentLabel.text = post["content"] as! String
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKey("user")
        query.limit = 20
        
        query.findObjectsInBackground { posts, error in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func onCreateNewPost(_ sender: Any) {
        performSegue(withIdentifier: "postSegue", sender: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

}
