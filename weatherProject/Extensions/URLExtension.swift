//
//  URLExtension.swift
//  weatherProject
//
//  Created by Defne Çetiner on 1.05.2023.
//

import Foundation
import UIKit

extension URL {
    
    // MARK: - Functions
    func withQueries(_ queries: [String : String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        
        return components?.url
    }
}
