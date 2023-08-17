//
//  LaunchConfigurator.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 17/08/23.
//

import Foundation

class LaunchConfigurator {
    class func view() -> LaunchViewController {
        var viewController = LaunchViewController()
        
        let presenter = LaunchPresenter()
        presenter.viewController = viewController
        
        let interactor = LaunchInteractor()
        interactor.presenter = presenter
        
        let router = LaunchRouter()
        router.viewController = viewController
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
