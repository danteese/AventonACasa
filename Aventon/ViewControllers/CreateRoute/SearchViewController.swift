//
//  SearchViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 11/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit 
import MapKit
import CoreLocation

class SearchViewController: UIViewController, DelegadoSitio, CLLocationManagerDelegate {
    
    @IBOutlet weak var DestinoView: UIView!
    @IBOutlet weak var ConfirmBtn: UIButton!
    
    let manager = CLLocationManager()
    
    func nuevoSitio(SitioRecibido: MKMapItem) {
        self.sitioSeleccionado = SitioRecibido
        print("New site")
        // Put in the destination label
        DestinoLabel.text = self.sitioSeleccionado.name
        
    }
    
    
    @IBOutlet weak var Mapa: MKMapView!
    @IBOutlet weak var DestinoLabel: UILabel!
    
    
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

        // Algunos estilos para la portada principal
        DestinoView.layer.shadowColor = UIColor.black.cgColor
        DestinoView.layer.shadowOpacity = 0.5
        DestinoView.layer.shadowOffset = CGSize.zero
        DestinoView.layer.shadowRadius = 5
        
        ConfirmBtn.isEnabled = false
        
        // Verificar si se tiene localización
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
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
    
    
    // MARK: -Obtener la localización del usuario si este quiere, sino la puede ingresar
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let myLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        Mapa.setRegion(region, animated: true)
        Mapa.showsUserLocation = true
        manager.stopUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("La autorización cambio a \(status.rawValue)")
        switch status {
            case .authorizedWhenInUse:
                manager.startUpdatingLocation()
            default:
                manager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alerta = UIAlertController(title: "Error en el servicio de localización", message: "Aún puedes elegir mediante el botón de +.", preferredStyle: .alert)
        let botonOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(botonOk)
        present(alerta, animated: true, completion: nil)
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
