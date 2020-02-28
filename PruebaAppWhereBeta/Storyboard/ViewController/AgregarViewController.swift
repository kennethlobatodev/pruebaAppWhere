//
//  AgregarViewController.swift
//  PruebaAppWhereBeta
//
//  Created by Xookyn on 26/02/20.
//  Copyright © 2020 kenneth. All rights reserved.
//

import UIKit
import Alamofire

class AgregarViewController: UIViewController {
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var direccionTextField: UITextField!
    
    @IBOutlet weak var telefonoTextField: UITextField!
    
    @IBOutlet weak var latitudTextField: UITextField!
    
    @IBOutlet weak var longitudTextField: UITextField!
    
    @IBOutlet weak var mensajeLabel: UILabel!
    
    var nombre: String = ""
    var direccion: String = ""
    var telefono: String = ""
    var latitud: Float = 0.0
    var longitud: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Bordes TextField
        nombreTextField.setBottomBorder()
        direccionTextField.setBottomBorder()
        telefonoTextField.setBottomBorder()
        latitudTextField.setBottomBorder()
        longitudTextField.setBottomBorder()
        
        // Mensaje oculto.
        mensajeLabel.isHidden = true
        
        //Se crea Gesture para ocultar el teclado
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    @IBAction func continuarButton(_ sender: UIButton) {
        //getAlamofiraApi()
        validarCampo()
        
    }
    
    func getDataAlamofire () {
        
        let url = "http://166.62.33.53:4590/api/session/login"
        
       AF.request(url).validate().responseJSON { response in
            debugPrint(response)
        }
        
        
    }
    
    func postDataAlamofire () {
        nombre = nombreTextField.text ?? ""
        direccion = direccionTextField.text ?? ""
        telefono = telefonoTextField.text ?? ""
        latitud = Float.init(latitudTextField.text ?? "")!
        longitud = Float.init(longitudTextField.text ?? "")!
        
        let url = "http://166.62.33.53:4590/register-merchant"
        let dato  = Ubicacion(latitude: latitud, longitude: longitud, merchantAddress: direccion, merchantName: nombre, merchantTelephone: telefono)
        AF.request(url,
               method: .post,
               parameters: dato,
               encoder: JSONParameterEncoder.default).response { response in
        debugPrint(response)
        }
        
    }
    
    func validarCampo() {
    
    let nombre = nombreTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    
    let direccion = direccionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    let telefono = telefonoTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    let latitud = latitudTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    
    let longitud = longitudTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    if nombre == "" || direccion == "" || telefono == "" || latitud == "" || longitud == "" {
        mensajeLabel.isHidden = false
        mensajeLabel.text = "Por favor llene todos los campos vacíos."

    }else if telefono!.count > 10 || telefono!.count < 10 {
        mensajeLabel.isHidden = false
        mensajeLabel.text = "Solo puede haber 10 dígitos en el campo de teléfono."
    }
    else{
        postDataAlamofire()
        mensajeLabel.isHidden = false
        mensajeLabel.text = "Sucursal agregada."
        
        }
        
    }

    
}

