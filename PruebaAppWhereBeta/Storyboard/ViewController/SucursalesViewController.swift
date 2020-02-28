//
//  SucursalesViewController.swift
//  PruebaAppWhereBeta
//
//  Created by Xookyn on 26/02/20.
//  Copyright © 2020 kenneth. All rights reserved.
//

import UIKit
import Alamofire

class SucursalesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sucursalTableView: UITableView!
    
    let sucursalesArray = ["AppWhere"]
    
    let direccionArray = ["Santa Rosalía 209, Insurgentes San Borja, 03100, Ciudad de México"]

    let telefonoArray = ["53233823"]
    
    let imagenesArray = ["appwhere"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate y DataSource del TableView
        self.sucursalTableView.delegate = self
        self.sucursalTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sucursalesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell : SucursalesTableViewCell = sucursalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SucursalesTableViewCell
        
        cell.sucursalLabel.text = sucursalesArray[indexPath.row]
        cell.direccionLabel.text = direccionArray[indexPath.row]
        cell.telefonoLabel.text = telefonoArray[indexPath.row]
        cell.sucursalImageView!.image = UIImage(named: imagenesArray[indexPath.row])
        
        return cell
    }
    
    func getDataAlamofire () {
        
        let url = "http://166.62.33.53:4590/get-merchants"
        
       AF.request(url).validate().responseJSON { response in
            
            debugPrint(response)
        
        
        }
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
