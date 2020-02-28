//
//  MapaViewController.swift
//  PruebaAppWhereBeta
//
//  Created by Xookyn on 26/02/20.
//  Copyright © 2020 kenneth. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import Alamofire

class MapaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
      // Create a GMSCameraPosition that tells the map to display the
      // coordinate -33.86,151.20 at zoom level 6.
      let camera = GMSCameraPosition.camera(withLatitude: 19.382295, longitude: -99.175295, zoom: 15)
      let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
      view = mapView

      // Creates a marker in the center of the map.
      let marker = GMSMarker()
      marker.position = CLLocationCoordinate2D(latitude: 19.382295, longitude: -99.175295)
      marker.title = "AppWhere"
      marker.snippet = "Ciudad De México"
      marker.map = mapView
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
