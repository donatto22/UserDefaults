//
//  ViewController.swift
//  appUserDefaults
//
//  Created by Donatto on 23/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var putButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var txtClave: UITextField!
    
    private let MyKey = "my_key"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // recuperar preferencias
    @IBAction func getButtonAction(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: MyKey) {
            showAlert(message: value)
        }
        
        else {
            showAlert(message: "No hay valor para esta clave")
        }
    }
    
    // guardar preferencias
    @IBAction func putButtonAction(_ sender: Any) {
        if txtClave.text == "" {
            showAlert(message: "El campo no debe estar vacio")
        }
        
        else {
            let texto = txtClave.text
            UserDefaults.standard.set(texto, forKey: MyKey)
            UserDefaults.standard.synchronize()
            
            showAlert(message: "Se ha guardado el valor")
        }
    }
    
    // borrar preferencias
    @IBAction func deleteButtonAction(_ sender: Any) {
        if UserDefaults.standard.string(forKey: MyKey) != nil {
            UserDefaults.standard.removeObject(forKey: MyKey)
            UserDefaults.standard.synchronize()
            
            showAlert(message: "Se ha eliminado el valor")
        }
        
        else {
            showAlert(message: "No hay nada para eliminar")
        }
    }
    
    // mostrar una alerta
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

