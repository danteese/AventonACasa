//
//  RegisterViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 11/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var Nombre: UITextField! {
        didSet {
            beautifyTextField(textField: Nombre)
        }
    }
    @IBOutlet weak var Apellido: UITextField! {
        didSet {
            beautifyTextField(textField: Apellido)
        }
    }
    @IBOutlet weak var Correo: UITextField! {
        didSet {
            beautifyTextField(textField: Correo)
        }
    }
    @IBOutlet weak var Cuenta: UITextField! {
        didSet {
            beautifyTextField(textField: Cuenta)
        }
    }
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
        RegisterBtn.backgroundColor = UIColor(red: 24/255, green: 112/255, blue: 248/255, alpha: 1.0)
        RegisterBtn.layer.cornerRadius = 3
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
