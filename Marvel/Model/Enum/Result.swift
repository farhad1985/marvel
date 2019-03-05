//
//  Result.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(value: T)
    case error(error: MarvelError)
}
