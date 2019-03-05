//
//  ExImageView.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(url: String) {
        guard let urlValid = URL(string: url) else {return}
        self.addActivity()
        backgroundColor = UIColor.clear
        
        URLSession.shared.dataTask(with: urlValid) { (data, response, error) in
            guard error == nil else {return}
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                self.removeActivity()
                self.image = UIImage(data: data)
            }
        }.resume()
    }
    
    private func addActivity() {
        let activity = UIActivityIndicatorView()
        activity.color = UIColor.white
        activity.startAnimating()
        
        addSubview(activity)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func removeActivity() {
        for item in self.subviews {
            if item.isKind(of: UIActivityIndicatorView.self) {
                item.removeFromSuperview()
                break
            }
        }
    }
}
