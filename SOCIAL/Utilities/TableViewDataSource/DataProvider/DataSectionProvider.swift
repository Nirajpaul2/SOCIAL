//
//  DataSectionProvider.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 3/25/19.
//  Copyright © 2019 Quyen Trinh. All rights reserved.
//

import Foundation

class DataSectionProvider<T: Any>: DataProvider<[T]> {
    
    override func item(at indexPath: IndexPath) -> [T] {
        return data[indexPath.section]
    }
    
    override func numberOfSections() -> Int {
        return data.count
    }
    
    override func numberOfRows(in section: Int) -> Int {
        return data[section].count
    }
    
}
