//
//  LaunchesPresenter.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import Foundation

protocol LaunchesPresenterProtocol {
    func showResults(_ launchesResponse: LaunchesModel.FetchLaunches.Response)
    func showResultsFiltered(_ launchesResponse: LaunchesModel.FetchLaunches.Response)
}

class LaunchesPresenter {
    var viewController: LaunchesViewControllerProtocol!
    
    func mapLaunches(lauches: Launches) -> [LaunchMapped] {
       return lauches.map { launch in
           let date = launch.launchDateUTC
           let name = launch.missionName
           let image = launch.links.missionPatch

           return LaunchMapped(flightNumber: launch.flightNumber, name: name, date: date, image: image)
        }
    }
}

extension LaunchesPresenter: LaunchesPresenterProtocol {
    func showResultsFiltered(_ launchesResponse: LaunchesModel.FetchLaunches.Response) {
        guard let launches = launchesResponse.launches else {
            return self.viewController.showLaunces(LaunchesModel.FetchLaunches.ViewModel(Launches: []))
        }
        
        self.viewController.showLaunces(LaunchesModel.FetchLaunches.ViewModel(Launches: mapLaunches(lauches: launches)))
    }
    
    func showResults(_ launchesResponse: LaunchesModel.FetchLaunches.Response) {
        guard let launches = launchesResponse.launches else {
            return self.viewController.showError(LaunchesModel.FetchLaunches.ViewModelError(error: launchesResponse.error?.localizedDescription ?? Constants.unexpectedError))
        }
    
        self.viewController.showLaunces(LaunchesModel.FetchLaunches.ViewModel(Launches: mapLaunches(lauches: launches)))
    }
}
