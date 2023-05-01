//
//  WeatherDescription.swift
//  weatherProject
//
//  Created by Defne Çetiner on 1.05.2023.
//

import Foundation
import UIKit

struct WeatherDescription: Codable {
    
    var iconName: String
    var description: String
    
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
    enum CodingKeys: String, CodingKey {
        case iconName = "icon"
        case description = "description"
        //  Özelliklerin bazılarının isimlerini arka tarafta değiştirmek için CodingKeys yapısını kullandım
    }
}
