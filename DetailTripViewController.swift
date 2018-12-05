//
//  DetailTripViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit

class DetailTripViewController: UIViewController {
    
    @IBOutlet weak var UnirmeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func unirme(_ sender: Any) {
        
        let alert = UIAlertController(title: "¡Felicidades te has unido!", message: "No olvides contactar a tu compañero de viaje.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
        self.navigationController?.popToRootViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
    }
    
}
