//
//  Ubicacion.swift
//  PruebaAppWhereBeta
//
//  Created by Xookyn on 28/02/20.
//  Copyright © 2020 kenneth. All rights reserved.
//

import Foundation

class Ubicacion: Encodable {
    var latitude: Float?
    var longitude: Float?
    var merchantAddress: String?
    var merchantName: String?
    var merchantTelephone: String?

    
    init(latitude: Float?, longitude: Float?, merchantAddress: String?, merchantName: String?, merchantTelephone: String?) {
        self.latitude = latitude
        self.longitude = longitude
        self.merchantAddress = merchantAddress
        self.merchantName = merchantName
        self.merchantTelephone = merchantTelephone

    }
    
    init(latitude : Float?, longitude: Float?) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(merchantAddress: String?, merchantName: String?, merchantTelephone: String?) {
        self.merchantAddress = merchantAddress
        self.merchantName = merchantName
        self.merchantTelephone = merchantTelephone
    }
}
