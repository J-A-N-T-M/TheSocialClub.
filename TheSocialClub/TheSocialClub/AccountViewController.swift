//
//  AccountViewController.swift
//  TheSocialClub
//
//  Created by Nubia Johnson on 4/17/22.
//

import UIKit
import Parse


class AccountViewController: UIViewController{
    

    @IBOutlet weak var profileAboutField: UITextField!
    
    @IBOutlet weak var profileInterestField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onUpdateButton(_ sender: Any) {
        let user = PFUser()
        //let image =
        let profile = PFObject(className: "Profile")
        let name = user["name"]
        
        profile["name"] = name
        profile["AboutUser"] = profileAboutField.text
        profile["Interests"] = profileInterestField.text
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
