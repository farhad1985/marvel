//
//  Route.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

let baseURL = "https://gateway.marvel.com:443"

enum Route: String {
    case characters = "/v1/public/characters"
    
    var url: String {
        return baseURL + self.rawValue
    }
}
