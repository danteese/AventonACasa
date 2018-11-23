//
//  LoginViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 11/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        let registerView = self.storyboard?.instantiateViewController(withIdentifier: "registro") as! RegisterViewController

            // If we need the new information for the delegate
        self.navigationController?.pushViewController(registerView, animated: true)
        
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
