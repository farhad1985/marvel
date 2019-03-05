//
//  Requestable.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

protocol Requestable where T: Codable {
    associatedtype T
}

extension Requestable {
    
    func request(route: Route,
                 HttpType: HttpType = .get,
                 param: [String: Any] = [:],
                 completion: @escaping((Result<T>) -> ())) {
        
        var urlComponents = URLComponents(string: route.url)
        
        urlComponents?.queryItems = getParam(param: param)
        
        guard let url = urlComponents?.url else {return}
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let res = response as? HTTPURLResponse,
                res.statusCode != 409 else {
                    completion(Result.error(error: MarvelError.noAuthenticate))
                    return
            }
            guard let data = data , data.count > 0 else {
                completion(Result.error(error: MarvelError.noData))
                return
            }
            guard let model = try? JSONDecoder().decode(T.self, from: data)else{return}
            completion(Result.success(value: model))
            }
            .resume()
    }
    
    private func getParam(param: [String: Any]) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        for item in param {
            queryItems.append(URLQueryItem(name: item.key,
                                           value: String(describing: item.value)))
        }
        return queryItems
    }
}
