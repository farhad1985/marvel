//
//  ExString.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import CommonCrypto
import Foundation

extension Data {
    
    var md5String:String {
        
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        var digestHex = ""
        self.withUnsafeBytes { (bytes: UnsafePointer<CChar>) -> Void in
            
            CC_MD5(bytes, CC_LONG(self.count), &digest)
            for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
                digestHex += String(format: "%02x", digest[index])
            }
        }
        return digestHex
    }
}
