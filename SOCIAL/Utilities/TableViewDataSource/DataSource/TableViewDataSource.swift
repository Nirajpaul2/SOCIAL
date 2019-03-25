//
//  TableViewDataSource.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 3/25/19.
//  Copyright © 2019 Quyen Trinh. All rights reserved.
//

import UIKit

class TableViewDataSource<Cell: UITableViewCell, Model: Any>: DataSource<Model>, UITableViewDataSource {
    
    var configureCell: ((Cell, Model, IndexPath) -> ())?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(for: indexPath) as Cell
        if let config = configureCell {
            let model = dataProvider.item(at: indexPath)
            config(cell, model, indexPath)
        }
        return cell
    }
    
}
