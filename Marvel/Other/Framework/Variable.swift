//
//  Variable.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

class Variable<T> {
    
    typealias Listener = ((_ value: T) -> ())
    
    var listener: Listener?
    
    var value: T {
        didSet {
            guard let listener = listener else {return}
            listener(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func setAction(listener: @escaping Listener) {
        self.listener = listener
    }
}
