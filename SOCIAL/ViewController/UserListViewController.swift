//
//  UserListViewController.swift
//  SOCIAL
//
//  Created by Quyen Trinh on 5/8/18.
//  Copyright © 2018 Quyen Trinh. All rights reserved.
//

import UIKit
import RxSwift

class UserListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    private var refreshControl: UIRefreshControl!
    
    fileprivate var viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
    }
    
    //MARK: - Setup
    
    override func setupUI() {
        super.setupUI()
        tableView.rowHeight = 90.0
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
    }
    
    override func bindUI()  {
        super.bindUI()
        viewModel
            .userList
            .asObservable()
            .bind(to: tableView.rx.items) { [weak self] tableView, index, event in
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell") as! UserListCell
                cell.person = self?.viewModel.userList.value[index]
                return cell
            }
            .disposed(by: bag)
        
        viewModel
            .isRefresh
            .asDriver()
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: bag)
        
        refreshControl.rx
            .controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] in
                self?.viewModel.loadData()
            }).disposed(by: bag)
        
        tableView.rx
            .modelSelected(Person.self)
            .subscribe(onNext: { [weak self] model in
                let detailVC = UserDetailViewController.initFromStoryboard()
                let detailViewModel = UserDetailViewModel(user: Variable(model))
                detailVC.viewModel = detailViewModel
                self?.navigationController?.pushViewController(detailVC, animated: true)
            })
            .disposed(by: bag)
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
