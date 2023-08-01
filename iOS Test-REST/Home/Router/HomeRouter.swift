//
//  HomeRouter.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import Foundation
import UIKit

class HomeRouter {
    var viewController: UIViewController{
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    private func createViewController() -> UIViewController{
        let view = HomeView(nibName: "HomeView", bundle: Bundle.main)
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else {fatalError("Error desconocido")}
        self.sourceView = view
    }
    
    func navigateToDetailView(user: User) {
        let detailView = DetailViewRouter(user: user).viewController
        sourceView?.navigationController?.pushViewController(detailView, animated: true)
    }
}
