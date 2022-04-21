//
//  NewPostViewController.swift
//  TheSocialClub
//
//  Created by Jasmine Makombe on 4/11/22.
//

import UIKit
import Parse

class NewPostViewController: UIViewController {
    @IBOutlet weak var postContentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onNewPostButton(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["user"] = PFUser.current()!
        post["content"] = postContentField.text!
        
        post.saveInBackground { success, error in
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
