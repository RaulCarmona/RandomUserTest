//
//  DetailViewModel.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import Foundation

class DetailViewModel {
    private weak var view: DetailView?
    private var router: DetailViewRouter?
    
    func bind(view: DetailView, router: DetailViewRouter){
        self.view = view
        self.router = router
        
        self.router?.setSourceView(view)
    }
}
