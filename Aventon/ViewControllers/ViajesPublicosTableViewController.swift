//
//  ViajesPublicosTableViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit
import CoreLocation

class ViajesPublicosTableViewController: UITableViewController {
    
    var viajesPublicos:[ViajeModificado] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let usuarios = appdelegate.users
        
        viajesPublicos = usuarios.obtenerViajesDeConductores()
        var count = 0
        for viaje in viajesPublicos {
            print("\(count) - \(viaje.Viaje.lugar)")
            count += 1
        }
        print(viajesPublicos.count)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viajesPublicos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viajeCell", for: indexPath) as! ViajeTableViewCell

        if viajesPublicos.count > 0{
            cell.Titulo.text = viajesPublicos[indexPath.row].Nombre
            cell.Subtitulo.text = viajesPublicos[indexPath.row].Coche.modelo + " (" + viajesPublicos[indexPath.row].Coche.placas + ")"
            cell.Cuerpo.text = formatDate(date:  viajesPublicos[indexPath.row].Viaje.fecha)
            // Calcular distancia
            let latitud1 = CLLocationDegrees( viajesPublicos[indexPath.row].Viaje.coordenadaOrigen.latitude)
            let longitud1 = CLLocationDegrees( viajesPublicos[indexPath.row].Viaje.coordenadaOrigen.longitude)
            let latitud2 = CLLocationDegrees( viajesPublicos[indexPath.row].Viaje.coordenadaDestino.latitude)
            let longitud2 = CLLocationDegrees( viajesPublicos[indexPath.row].Viaje.coordenadaDestino.longitude)
            let origen = CLLocation(latitude: latitud1, longitude: longitud1)
            let destino = CLLocation(latitude: latitud2, longitude: longitud2)
            let distanceInMeters = origen.distance(from: destino)
            cell.Lugares.text = String(format: "Distancia total: %0.3f km", distanceInMeters/1000)
        }
        
        // Configure the cell...

        return cell
    }
    
    func formatDate(date: Date) -> String {
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatterPrint.string(from: date)
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
