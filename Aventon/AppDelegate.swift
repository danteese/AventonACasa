//
//  AppDelegate.swift
//  Aventon
//
//  Created by Dante Bazaldua on 11/3/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Agregar un usuario, viajes, coches, etc... para simular
    var users = Usuarios()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Pasajero
        let uuid_usuario = UUID().uuidString
        let usuarioPredeterminado = Usuario(nombre: "Dante", apellido: "Bazaldua", correo: "nte111da@gmail.com", id_ibero: "194083-2", uuid: uuid_usuario, password: "1234")
        
        users.agregarUsuario(usuario: usuarioPredeterminado)
        
        // Agregar Usuarios Drivers
        // Primer usuario
        let driver1 = Usuario(nombre: "Yohana", apellido: "Temple", correo: "ohmytemple@gmail.com", id_ibero: "194400-0", uuid: UUID().uuidString, password: "holamundo")
        let coche1 = Coche(placas: "DF-123-00", anio: "2010", cajuela: true, modelo: "Nissan Versa", uuid:UUID().uuidString)
        let viaje1 = Viaje(coordenadaOrigen: CLLocationCoordinate2D(latitude: 19.3640, longitude: -99.2651), coordenadaDestino: CLLocationCoordinate2D(latitude: 19.504401, longitude: -99.132485), fecha: Date(), uuid: UUID().uuidString)
        driver1.viajes.append(viaje1)
        driver1.coches.append(coche1)
        
        
        let driver2 = Usuario(nombre: "Jesus", apellido: "Fragoso", correo: "jesus.fragoso@gmail.com", id_ibero: "199199-2", uuid: UUID().uuidString, password: "hacker")
        let coche2 = Coche(placas: "DF-123-01", anio: "2015", cajuela: true, modelo: "Renault Duster", uuid:UUID().uuidString)
        let viaje2 = Viaje(coordenadaOrigen: CLLocationCoordinate2D(latitude: 19.436410, longitude: -99.071973), coordenadaDestino: CLLocationCoordinate2D(latitude: 19.370390, longitude: -99.263901), fecha: Date(), uuid: UUID().uuidString)
        driver2.viajes.append(viaje2)
        driver2.coches.append(coche2)
        
        users.agregarUsuario(usuario: driver1)
        users.agregarUsuario(usuario: driver2)
        
        
        let rootVC = window!.rootViewController as! UINavigationController
        let loginVC = rootVC.topViewController as! LoginViewController
        loginVC.usuarios = users
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

