//
//  LaunchesRouter.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import Foundation

protocol LaunchesRouterProtocol {
    func goToLaunch()
}

class LaunchesRouter {
    weak var viewController: LaunchesViewController?
}

extension LaunchesRouter: LaunchesRouterProtocol {
    func goToLaunch() {
        
    }
}
