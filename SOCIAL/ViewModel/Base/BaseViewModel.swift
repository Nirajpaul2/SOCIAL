//
//  BaseViewModel.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 3/25/19.
//  Copyright © 2019 Quyen Trinh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewModel {
    
    let bag = DisposeBag()
    
    init() {
        bindOutput()
    }
    
    func bindOutput() {
        // Override
    }
    
}
