//
//  LoginViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 11/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        UserField.delegate = self
        PasswordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
            self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
    @IBAction func logIn(_ sender: UIButton) {
        
        let mainViewController = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        
        present(mainViewController!, animated: true, completion: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden   (false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
}
