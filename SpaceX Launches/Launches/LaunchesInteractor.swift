//
//  LaunchesInteractor.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import Foundation

protocol LaunchesInteractorProtocol {
    func getLaunches()
    func searchLaunches(query: String?)
}

class LaunchesInteractor {
    var presenter: LaunchesPresenterProtocol!
    let worker: LaunchesWorker = LaunchesWorker()
    var launches: Launches = []
}

extension LaunchesInteractor: LaunchesInteractorProtocol {
    func getLaunches() {
        worker.get { response in
            self.presenter.showResults(response)
            self.launches = response.launches ?? []
        }
    }
    
    func searchLaunches(query: String?) {
        guard let searchText = query, !searchText.isEmpty else {
           return presenter.showResultsFiltered(LaunchesModel.FetchLaunches.Response(launches: launches))
        }
        
        let filteredLaunches = launches.filter { launch in
            launch.missionName.contains(searchText)
        }
        
        presenter.showResultsFiltered(LaunchesModel.FetchLaunches.Response(launches: filteredLaunches))
    }
}
