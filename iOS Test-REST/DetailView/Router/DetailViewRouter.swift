//
//  DetailViewRouter.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import Foundation
import UIKit

class DetailViewRouter {
    var viewController: UIViewController{
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    private func createViewController() -> UIViewController{
        let view = DetailView(nibName: "DetailView", bundle: Bundle.main)
        view.user = user
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else {fatalError("Error desconocido")}
        self.sourceView = view
    }
}
