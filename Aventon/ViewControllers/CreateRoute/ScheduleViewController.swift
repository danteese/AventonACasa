//
//  ScheduleViewController.swift
//  Aventon
//
//  Created by Dante Bazaldua on 12/4/18.
//  Copyright © 2018 Dante Bazaldua. All rights reserved.
//

import UIKit
import EventKit

class ScheduleViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var DateSelection: UITextField!
    var datepicker = UIDatePicker()
    
    @IBOutlet weak var NombreDeEvento: UITextField!

    let eventStore = EKEventStore();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "Fecha"
        createDatePicker()
        
        self.NombreDeEvento.delegate = self
        
        eventStore.requestAccess(to: EKEntityType.reminder, completion:
            {(granted, error) in
                if !granted {
                    let alert = UIAlertController(title: "Acceso denegado a recordatorios.", message: "No podré guardar tus recordatorios :( ", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                }
                else{
                    print("acceso correcto")
                }
        })

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    /*
     * createDatePicker
     * Cambia el teclado de input para poder ser del tipo de teclado para fecha y tiempo.
     */
    func createDatePicker() {
        
        datepicker.datePickerMode = .dateAndTime
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneSelected))
        toolbar.setItems([doneBtn], animated: true)
        DateSelection.inputAccessoryView = toolbar
        
        DateSelection.inputView = datepicker
        
    }
    
    @objc func doneSelected() {
        DateSelection.text = "\(datepicker.date)"
        self.view.endEditing(true)
    }
    
    @IBAction func crearEvento(_ sender: Any) {
        
        let reminder = EKReminder(eventStore: self.eventStore)
        
        reminder.title = "(Aventón): Viaje a " + (NombreDeEvento.text ?? "algun lugar.")
        reminder.calendar = eventStore.defaultCalendarForNewReminders()
        reminder.priority = 0
        reminder.isCompleted = false
        
        let alarmTime = Date().addingTimeInterval(1*60*10)
        let alarm = EKAlarm(absoluteDate: alarmTime)
        reminder.addAlarm(alarm)
        
        reminder.calendar = self.eventStore.defaultCalendarForNewReminders()
        
        do {
            try eventStore.save(reminder,
                                commit: true)
            
            let alert = UIAlertController(title: "Recordatorio se agregó", message: "Fecha: " + formatDate(date: datepicker.date) + ". Sonará en 10 min.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
        } catch let error {
            // Ask for confirmation
            print(error)
            
            let alert = UIAlertController(title: "Recordatorio no se pudo agregar", message: "Verifica tus permisos", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        

    }
    
    
    func formatDate(date: Date) -> String {

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatterPrint.string(from: date)
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
