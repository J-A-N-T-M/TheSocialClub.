//
//  NewGroupViewController.swift
//  TheSocialClub
//
//  Created by Jasmine Makombe on 4/18/22.
//

import UIKit
import Parse

class NewGroupViewController: UIViewController {

    @IBOutlet weak var newGroupNameField: UITextField!
    @IBOutlet weak var newGroupCategory: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func onCreateGroupButton(_ sender: Any) {
        let group = PFObject(className: "Groups")
        group["owner"] = PFUser.current()!
        group["groupname"] = newGroupNameField.text
        group["category"] = newGroupCategory.text
        
        group.saveInBackground { success, error in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else{
                print("error!")
            }
        }
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
