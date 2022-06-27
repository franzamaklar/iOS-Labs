//
//  Destination.swift
//  LV1_Zamaklar
//
//  Created by student on 23.04.2022..
//

import UIKit

class Destination: Codable {
    let id: String
    var ime: String
    var opis: String
    
    init(ime:String, opis:String){
        self.id = UUID().uuidString
        self.ime = ime
        self.opis = opis
    }

}
