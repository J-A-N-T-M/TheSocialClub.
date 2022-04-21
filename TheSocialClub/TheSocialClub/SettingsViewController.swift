//
//  SettingsViewController.swift
//  TheSocialClub
//
//  Created by Nubia Johnson on 4/17/22.
//

import UIKit
import Parse



class SettingsViewController: UIViewController {
    
    @IBOutlet weak var changePassword: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        PFUser.logOutInBackground()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let settings = PFObject(className: "Settings")
        settings["user"] = PFUser.current()!
        settings["newPassword"] = changePassword.text!
        settings["Email"] = emailField.text!
        
        
        settings.saveInBackground { success, error in
            if success{
                self.performSegue(withIdentifier: "saveSegue", sender: nil)
                PFUser.current()?.password = self.changePassword.text!
                print(PFUser.current()?.password)
                print("saved!")
            } else{
                print("error!")
            }
        }
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
        PFUser.current()!
        changePassword.text = settings["newPassword"] as! String
        emailField.text = settings["Email"] as! String
        
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
