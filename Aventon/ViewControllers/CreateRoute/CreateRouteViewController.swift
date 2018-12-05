//
//  CreateRouteViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/3/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit

class CreateRouteViewController: UIViewController {

    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var MensajeLabel: UILabel!
    @IBOutlet weak var VistaImagen: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        BackgroundView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        BackgroundView.layer.cornerRadius = 10.0
        
        BackgroundView.layer.masksToBounds = false
        BackgroundView.layer.shadowColor = UIColor.black.cgColor
        BackgroundView.layer.shadowOpacity = 0.3
        BackgroundView.layer.shadowOffset = CGSize(width: -1, height: 1)
        BackgroundView.layer.shadowRadius = 5
        
        
        VistaImagen.layer.masksToBounds = true
        VistaImagen.clipsToBounds = true
        VistaImagen.layer.cornerRadius = 10.0
    
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
