//
//  DataSource.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 3/25/19.
//  Copyright © 2019 Quyen Trinh. All rights reserved.
//

import UIKit

class DataSource<Model: Any>: NSObject {

    var dataProvider: DataProvider<Model>
    
    init(dataProvider: DataProvider<Model>) {
        self.dataProvider = dataProvider
    }
    
}
