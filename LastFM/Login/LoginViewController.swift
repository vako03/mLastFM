//
//  ViewController.swift
//  LastFM
//
//  Created by valeri mekhashishvili on 13.07.23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var fieldUserName: UITextField!
    
    @IBOutlet weak var fieldPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onLogin(_ sender: Any) {
        if (fieldPassword.text ?? "") == "1" && (fieldPassword.text ?? "") == "1" {
            let sb = UIStoryboard(name: "TabBarController", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "TabBarController")
            navigationController?.setViewControllers([vc], animated: true)
            
            UserDefaults.standard.set(true, forKey: UserDefaultKeys.userLoggedIn)
        }
    }
}



