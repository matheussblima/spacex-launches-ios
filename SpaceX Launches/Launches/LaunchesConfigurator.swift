//
//  Configurator.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import Foundation

class LaunchesConfigurator {
    class func view() -> LaunchesViewController {
        let viewController = LaunchesViewController()
        
        let presenter = LaunchesPresenter()
        presenter.viewController = viewController
        
        let interactor = LaunchesInteractor()
        interactor.presenter = presenter
        
        let router = LaunchesRouter()
        router.viewController = viewController
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}

protocol LaunchesViewControllerProtocol {
    func showLaunces(_ launches: LaunchesModel.FetchLaunches.ViewModel)
}

protocol LaunchesInteractorProtocol {
    func getLaunches()
}

protocol LaunchesPresenterProtocol {
    func showResults(_ launches: LaunchesModel.FetchLaunches.Response)
}

protocol LaunchesRouterProtocol {
    func goToLaunch()
}

