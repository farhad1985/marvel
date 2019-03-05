//
//  ViewController.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var collection: UICollectionView!
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Hero Characters"
        setCollection()
        bindUI()
        
        viewModel.fetchHeros()
    }
    
    private func setCollection() {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.addSubview(collection)
        collection.dataSource = self
        collection.delegate = self
        collection.register(HeroCell.self, forCellWithReuseIdentifier: "HeroCell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collection.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.datasource.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as! HeroCell
        cell.config(model: viewModel.datasource.value[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 3
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}

extension MainViewController: Bindable {
    func bindUI() {
        viewModel.datasource.setAction { (state) in
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
        }
    }
}
