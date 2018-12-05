//
//  SearchDestinationViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/3/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit
import MapKit

class SearchDestinationViewController: UIViewController, DelegadoSitio {
    
    @IBOutlet weak var Mapa: MKMapView!
    @IBOutlet weak var DestinoView: UIView!
    @IBOutlet weak var ConfirmBtn: UIButton!
    @IBOutlet weak var DestinoLabel: UILabel!
    
    func nuevoSitio(SitioRecibido: MKMapItem) {
        self.sitioSeleccionado = SitioRecibido
        print("New site")
        // Put in the destination label
        DestinoLabel.text = self.sitioSeleccionado.name
    }
    
    

    var sitioSeleccionado : MKMapItem = MKMapItem() {
        didSet{
            if self.sitioSeleccionado.name == "Unknown Location" {
                print("Botón desabilitado")
                self.ConfirmBtn.isEnabled = false
            }
            else{
                self.ConfirmBtn.isEnabled = true
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DestinoView.layer.shadowColor = UIColor.black.cgColor
        DestinoView.layer.shadowOpacity = 0.5
        DestinoView.layer.shadowOffset = CGSize.zero
        DestinoView.layer.shadowRadius = 5
        
        ConfirmBtn.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if sitioSeleccionado.name != "Unknown Location" {
            drawAnnotation()
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func addNewDirection(_ sender: Any) {
        
        let SearchDirectionsViewController = storyboard?.instantiateViewController(withIdentifier: "busquedaDirecciones") as! SearchDirectionsTableViewController
        
        SearchDirectionsViewController.delegate = self
        
        self.navigationController?.pushViewController(SearchDirectionsViewController, animated: true)
    }
    
    
    func drawAnnotation() {
        
        print("Entré a dibujar la anotacion")
        
        // Quitar las anotaciones
        let annotations = self.Mapa.annotations
        self.Mapa.removeAnnotations(annotations)
        
        // Obtener coordenadas
        let latitud = sitioSeleccionado.placemark.coordinate.latitude
        let longitud = sitioSeleccionado.placemark.coordinate.longitude
        
        // Crear annotation
        let annotation = MKPointAnnotation()
        annotation.title = sitioSeleccionado.name
        annotation.coordinate = CLLocationCoordinate2DMake(latitud, longitud)
        self.Mapa.addAnnotation(annotation)
        
        // Zoom en la coordenada
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitud, longitud)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(coordinate, span)
        self.Mapa.setRegion(region, animated: true)
    }

}
