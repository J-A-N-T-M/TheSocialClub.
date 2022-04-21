//
//  AccountCreationViewController.swift
//  TheSocialClub
//
//  Created by Jasmine Makombe on 4/6/22.
//

import UIKit
import Parse

class AccountCreationViewController: UIViewController {

    @IBOutlet weak var createUsernameField: UITextField!
    @IBOutlet weak var createPasswordField: UITextField!
    @IBOutlet weak var createNameField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = createUsernameField.text
        user.password = createPasswordField.text
        //user["name"] = createNameField.text
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "createAccToHomeSegue", sender: nil)
            } else{
                print("Error:\(error?.localizedDescription)")
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
