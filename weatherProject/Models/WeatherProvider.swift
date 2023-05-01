//
//  WeatherProvider.swift
//  weatherProject
//
//  Created by Defne Çetiner on 1.05.2023.
//

import Foundation
import UIKit
import CoreLocation

class WeatherProvider {
   
    public let apiKey = "71b72df2a5da431a90cf6e13b36c1815"
    public let baseURL = URL(string: "https://api.weatherbit.io/v2.0/current")!
    public let jsonDecoder = JSONDecoder()
    
    // MARK: - Functions
    func getWeather(for location: CLLocationCoordinate2D, completion: @escaping (Weather?) -> Void) {
        let queries: [String : String] = [
            "lat": String(location.latitude),
            "lon": String(location.longitude),
            "lang": "tr",
            "key": apiKey
        ]
        let requestURL = baseURL.withQueries(queries)!
        
        URLSession.shared.dataTask(with: requestURL) { data, _, _ in
            guard let weatherData = data else {
                completion(nil)
                return
            }
            do {
                let weather = try self.jsonDecoder.decode(Weather.self, from: weatherData)
                DispatchQueue.main.async {
                    completion(weather)
                    print(weather)
                }
            } catch {
                completion(nil)
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
