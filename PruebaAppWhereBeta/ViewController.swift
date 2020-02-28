//
//  ViewController.swift
//  PruebaAppWhereBeta
//
//  Created by Xookyn on 25/02/20.
//  Copyright © 2020 kenneth. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var contraseñaTextField: UITextField!
    
    @IBOutlet weak var mensajeLabel: UILabel!
    
    var email: String = ""
    var contraseña: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Icono emailTextField
        let emailImage = UIImage(named: "IconEmail")
        addRightImg(txtField: emailTextField, andImage: emailImage!)
        
        let contraseñaImage = UIImage(named: "IconPassword")
        addRightImg(txtField: contraseñaTextField, andImage: contraseñaImage!)
        
        //Se crea Gesture para ocultar el teclado
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)

        //Mensaje oculto
        mensajeLabel.isHidden = true
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        validarCampo()
    }
    
    func validarCampo() {
            
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
        let contraseña = contraseñaTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
        if email == "" || contraseña == "" {
            mensajeLabel.isHidden = false
            mensajeLabel.text = "Por favor llene todos los campos vacíos."
        }else
            if email?.isValidEmail() == false {
            mensajeLabel.isHidden = false
            mensajeLabel.text = "Correo electrónico inválido."
        }else if contraseña!.count > 8 {
            mensajeLabel.isHidden = false
            mensajeLabel.text = "Tu contraseña solo debe tener 8 caracteres."
        }else  {
            getAlamoFire()
            goHome()
        }

    }
    
    func goHome(){
        print("HOME")
        let mainStoryboard = UIStoryboard(name: "HomeStoryboard", bundle: Bundle.main)
        
        guard let mainNvigationVC = mainStoryboard.instantiateViewController(identifier: "Home") as? HomeController else {
            return
        }
        mainNvigationVC.modalPresentationStyle = .fullScreen
                   
        self.present(mainNvigationVC, animated: true, completion: nil)
    }
    
    func getAlamoFire(){
        email = emailTextField.text ?? ""
        contraseña = contraseñaTextField.text ?? ""
        
        let login = Login(email: email, password: contraseña)
        let url = "http://166.62.33.53:4590/api/session/login?email=prueba%40appwhere.mx&password=Appwhere"

        AF.request(url,
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { response in
        debugPrint(response)
            }
    }
    
    //Agregar Icono al TextField
    func addRightImg(txtField: UITextField, andImage img: UIImage){
        let rightImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        rightImageView.image = img
        
        let iconContainerView: UIView = UIView(frame:
                       CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(rightImageView)
        
        txtField.rightView = iconContainerView
        txtField.rightViewMode = .always
    }
    
    
}

 extension UITextField {
    func setBottomBorder() { self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.init(red: 0.00, green: 0.52, blue: 0.47, alpha: 1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        
    }
    
    func setPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    
}

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

struct Login: Encodable {
    let email: String
    let password: String
}
