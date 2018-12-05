//
//  RegisterViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 11/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var NuevoUsuario:Usuario = Usuario(nombre: "", apellido: "", correo: "prueba@ibero.mx", id_ibero: "194000", uuid: UUID().uuidString, password: "1234")

    @IBOutlet weak var Nombre: UITextField! {
        didSet {
            beautifyTextField(textField: Nombre)
            NuevoUsuario.nombre = self.Nombre.text!
        }
    }
    @IBOutlet weak var Apellido: UITextField! {
        didSet {
            beautifyTextField(textField: Apellido)
            NuevoUsuario.apellido = self.Apellido.text!
        }
    }
    @IBOutlet weak var Correo: UITextField! {
        didSet {
            beautifyTextField(textField: Correo)
            NuevoUsuario.correo = self.Correo.text!
        }
    }
    @IBOutlet weak var Cuenta: UITextField! {
        didSet {
            beautifyTextField(textField: Cuenta)
            NuevoUsuario.id_ibero = self.Cuenta.text!
        }
    }
    
    @IBOutlet weak var Password: UITextField! {
        didSet {
            beautifyTextField(textField: Password)
            NuevoUsuario.password = self.Password.text!
        }
    }
    
    var textFields:[UITextField]?
    
    @IBOutlet weak var RegisterBtn: UIButton!
    
    func beautifyTextField(textField: UITextField) {
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "Registro"
        
        RegisterBtn.layer.cornerRadius = 3
        
        Nombre.delegate = self
        Apellido.delegate = self
        Correo.delegate = self
        Cuenta.delegate = self
        Password.delegate = self
        
        textFields = [Nombre, Apellido, Correo, Cuenta, Password]
        
        for textfield in textFields! {
            textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
        
        // Push up the view when keyboard appears
        // https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        RegisterBtn.isEnabled = false
        
        guard let name = textFields![0].text, name != "" else {
//            print("textField 1 is empty")
            return
        }
        
        guard let lastName = textFields![1].text, lastName != "" else {
//            print("textField 2 is empty")
            return
        }
        
        guard let email = textFields![2].text, email != "" else {
//            print("textField 3 is empty")
            return
        }
        
        guard let account = textFields![3].text, account != "" else {
//            print("textField 4 is empty")
            return
        }
        
        guard let password = textFields![4].text, password != "" else {
//            print("Textfield 5 is empty")
            return
        }
        
        // set button to true whenever all textfield criteria is met.
        RegisterBtn.isEnabled = true
    }

    
    @IBAction func Registrar(_ sender: Any) {
        
        let alert = UIAlertController(title: "Registro completado", message: "Bienvenido " + NuevoUsuario.nombre + ".", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Entrar", style: .default, handler: { (action) -> Void in
            print("Regresando a la otra interface")
        
            self.navigationController?.popViewController(animated: true)
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
