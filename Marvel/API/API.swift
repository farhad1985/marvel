//
//  API.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

class API {
    var publichApiKey = "dbde227c16547c0457a1d2931ed08ed9"
    var privateApiKey = "749b26b8d23569405da97a1bbad162e95b1a5c46"
    
    static let shared = API()
    let defaultSession = URLSession(configuration: .default)
    
    var ts = ""
    
    init() {
        ts = String(Date().timeIntervalSince1970)
    }
    
    var hash: String {
        let hs = ts + privateApiKey + publichApiKey
        return hs.data(using: .utf8)?.md5String ?? ""
    }
}

extension API: Requestable {
    typealias T = CharacterDataWrapper
    
    func fetchCharacters(completion: @escaping((Result<CharacterDataWrapper>) -> ())) {
        let param = ["ts": ts,
                     "apikey": publichApiKey,
                     "hash": hash]

        request(route: Route.characters, param: param, completion: completion)
    }
}
