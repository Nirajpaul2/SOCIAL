//
//  UserListViewModel.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 5/8/18.
//  Copyright © 2018 Quyen Trinh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Moya

class UserListViewModel: BaseViewModel {

    // MARK: - Input
    
    // MARK: - Output
    
    var userList : Variable<[Person]>!
    var isRefresh : Variable<Bool>!
    
    override init() {
        super.init()
        userList = Variable<[Person]>([])
        isRefresh = Variable<Bool>(false)
    }
    
    func loadData() {
        
        self.isRefresh.value = true
        
        APIProvider.shared.getUserList().subscribe(onSuccess: { [unowned self] response in
            let json = try? response.mapJSON()
            guard let persons = json as? Array<[String: Any]> else {return}
            var result = Array<Person>()
            for person in persons {
                let user = Person(JSON: person)
                result.append(user!)
            }
            self.userList.value = result
            self.isRefresh.value = false
        }) {error in
            print(error.localizedDescription)
        }.disposed(by: bag)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
