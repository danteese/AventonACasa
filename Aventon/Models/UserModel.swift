//
//  UserModel.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

/*
 * Estructura Viaje
 * Sirve para almacenar los datos del viaje.
 * rel - es la relación con la persona.
 */
struct Viaje {
    var coordenadaOrigen:CLLocationCoordinate2D
    var coordenadaDestino:CLLocationCoordinate2D
    var fecha:Date
    var uuid:String
    var lugar:String
    var isDrive:Bool
}


/*
 * Estructura Coche
 * Sirve para almacenar los datos del usuario.
 * rel - es la relación con la persona.
 */
struct Coche {
    var placas:String
    var anio:String
    var cajuela:Bool
    var modelo:String
    var uuid:String
}


class Usuario: NSObject {
    var nombre:String
    var apellido:String
    var correo:String
    var id_ibero:String
    var telefono:String
    var id_pasajero:String
    var password:String
    
    var viajes = [Viaje]()
    var coches = [Coche]()
    
    init(nombre: String, apellido: String, correo: String, id_ibero:String, uuid:String?, password: String ) {
        self.nombre = nombre
        self.apellido = apellido
        self.correo = correo
        self.id_ibero = id_ibero
        self.id_pasajero = uuid!
        self.telefono = "0"
        self.password = password
        super.init()
    }
    
    //Inicializador de conveniencia
    convenience init(aleatorio: Bool = false) {
        if aleatorio{
            let nombres = ["Yohana", "Jesús", "Dante", "Nathan"]
            let correos = ["correo0@ibero.mx", "correo1@ibero.mx", "correo3@ibero.mx"]
            let ids = ["194083-2", "194400-0", "194832-1"]
            let correoAleatorio = correos[Int(arc4random_uniform(UInt32(correos.count)))]
            let idAleatorio = ids[Int(arc4random_uniform(UInt32(ids.count)))]
            let nombreAleatorio = nombres[Int(arc4random_uniform(UInt32(nombres.count)))] + " Prueba"
            
            //UUID te da un número de serie aleatorio
            let uuid = UUID().uuidString.components(separatedBy: "-").first!
            self.init(nombre: nombreAleatorio, apellido: "Prueba", correo: correoAleatorio, id_ibero: idAleatorio, uuid: uuid, password: "1234")
        }else {
            self.init(nombre: "Prueba", apellido: "Prueba", correo: "prueba@ibero.mx", id_ibero: "0000-00", uuid: nil, password: "1234")
        }
    }
    
    /*
     * Funciones CRUD para viajes
     */
    
    @discardableResult func agregaViaje(viaje: Viaje) -> Viaje {
        self.viajes.append(viaje)
        return viaje
    }
    
    func borraViaje(viajeAEliminar: Viaje){
        var count = 0
        for viaje in viajes {
            if viaje.uuid == viajeAEliminar.uuid {
                viajes.remove(at: count)
                return
            }
            count += 1
        }
        
    }
    
    func listaViajesDeUsuario() -> [Viaje]{
        return self.viajes
        
    }
    
    /*
     * Funciones CRUD para coches
     */
    
    @discardableResult func agregaCoches(coche: Coche) -> Coche {
        self.coches.append(coche)
        return coche
    }
    
    func borraCoche(cocheAEliminar: Coche) {
        var count = 0
        for coche in coches {
            if coche.uuid == cocheAEliminar.uuid {
                coches.remove(at: count)
                return
            }
            count += 1
        }
    }
    
    func listaDeCoches() -> [Coche]{
        return self.coches
        
    }
    
}



