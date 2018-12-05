//
//  UserModel.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import Foundation

class Usuario: NSObject {
    var nombre:String
    var apellido:String
    var correo:String
    var id_ibero:String
    var telefono:String
    var id_pasajero:String
    var password:String
    
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
}

