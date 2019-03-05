//
//  MainViewModel.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

class MainViewModel {
    
    var datasource = Variable(value: [Character]())
    
    func fetchHeros() {
        API.shared.fetchCharacters { (result) in
            switch result {
            case .success(let value):
                self.datasource.value = value.data.results
            case .error(let error):
                print(error)
            }
        }
    }
}
