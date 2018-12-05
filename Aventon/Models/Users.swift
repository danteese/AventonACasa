//
//  Users.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import Foundation

class Usuarios:NSObject {
    
    var usuarios = [Usuario]()
    var id_Selected = ""
    
    func setUsuarioActual(usuario: Usuario) {
        id_Selected = usuario.id_pasajero
        print("Se ha cambiado de usuario")
    }
    
    @discardableResult func agregarUsuario(usuario: Usuario) -> Usuario {
        usuarios.append(usuario)
        return usuario
    }
    
    func borraUsuario(usuario:Usuario){
        
        if let indiceDeUsuario = usuarios.index(of: usuario) {
            usuarios.remove(at: indiceDeUsuario)
        }
    }
    
    func infoUsuarioSeleccionado() -> Usuario?{
        for user in self.usuarios {
            if user.id_pasajero == self.id_Selected {
                return user
            }
        }
        return nil
    }
    
    func iniciarSesion(usuario: String, password: String) -> Usuario?{
        for user in self.usuarios {
            if (user.id_ibero == usuario) && (user.password == password){
                print(user.id_ibero, user.password)
                return user
            }
        }
        return nil
    }
    
    func dameUsuarios() -> [Usuario] {
        return self.usuarios
    }
    
}
