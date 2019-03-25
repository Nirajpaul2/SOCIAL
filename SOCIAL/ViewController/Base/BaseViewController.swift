//
//  BaseViewController.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 3/25/19.
//  Copyright © 2019 Quyen Trinh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController, StoryboardInitializable {

    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
    }
    
    func setupUI() {
        // Override
    }
    
    func bindUI() {
        // Override
    }
    
    func bindCommonViewModel(_ viewModel: BaseViewModel) {
        
    }
}
