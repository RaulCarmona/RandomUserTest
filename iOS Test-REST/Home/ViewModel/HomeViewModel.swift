//
//  HomeViewModel.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didReceiveData(users: [User])
    func didFailure()
}

class HomeViewModel {
    private weak var view: HomeView?
    private var router: HomeRouter?
    weak var delegate: HomeViewModelDelegate?
    
    func bind(view: HomeView, router: HomeRouter){
        self.view = view
        self.router = router
        
        self.router?.setSourceView(view)
    }
    
    func getListUsersData(users: String?, gender: Gender?) {
        let managerConection = ManagerConnections()
        managerConection.fetchUsers(users: users, gender: gender) { [weak self] success, data in
            if success, let data = data {
                self?.delegate?.didReceiveData(users: data)
            } else {
                self?.delegate?.didFailure()
            }
        }
    }
    
    func goToDetailView(user: User) {
        router?.navigateToDetailView(user: user)
    }
}
