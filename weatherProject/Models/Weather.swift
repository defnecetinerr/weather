//
//  Weather.swift
//  weatherProject
//
//  Created by Defne Çetiner on 1.05.2023.
//

import Foundation
import UIKit

struct Weather: Codable {
    var cityName: String
    var data: [DailyWeather]
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case data = "data"
    }
}
