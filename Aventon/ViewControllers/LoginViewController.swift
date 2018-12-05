//
//  LoginViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 11/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var usuarios : Usuarios! // Porque sabemos que siempre hay algo
    
    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        UserField.delegate = self
        PasswordField.delegate = self
        PasswordField.isSecureTextEntry = true
        
        
        // Push up the view when keyboard appears
        // https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        guard let usuario = usuarios.infoUsuarioSeleccionado() else {
            return
        }
        print(usuario)
        
        
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= (keyboardSize.height/2)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += (keyboardSize.height/2)
            }
        }
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
        
        guard let username = UserField.text, !username.isEmpty else {
            return
        }
        guard let password = PasswordField.text, !password.isEmpty else{
            return
        }
        
        if let usuario = usuarios.iniciarSesion(usuario: username, password: password) {
            // Si se encuentra
            usuarios.setUsuarioActual(usuario: usuario) // Poner toda la información del usuario.
            
            let alert = UIAlertController(title: "Bienvenido " + usuario.nombre, message: "Comparte el ride ;)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
                // Mandar el modelo
                let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
                mainViewController?.usuarios = self.usuarios
                self.present(mainViewController!, animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
            
        }
        else{
            UserField.text = ""
            PasswordField.text = ""
            let alert = UIAlertController(title: "Contraseña incorrecta", message: "Verifica tu cuenta. (194083-2/1234)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden   (false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
}
