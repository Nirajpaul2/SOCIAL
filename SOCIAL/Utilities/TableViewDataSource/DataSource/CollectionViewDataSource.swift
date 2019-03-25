//
//  CollectionViewDataSource.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 3/25/19.
//  Copyright © 2019 Quyen Trinh. All rights reserved.
//

import UIKit

class CollectionViewDataSource<Cell: UICollectionViewCell, Model: Any>: DataSource<Model>, UICollectionViewDataSource {
    
    var configureCell: ((Cell, Model, IndexPath) -> ())?
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataProvider.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.numberOfRows(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as Cell
        if let config = configureCell {
            let model = dataProvider.item(at: indexPath)
            config(cell, model, indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
        
    }
    
}
