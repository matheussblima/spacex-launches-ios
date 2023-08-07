//
//  LaunchesInteractor.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import Foundation

class LaunchesInteractor {
    var presenter: LaunchesPresenterProtocol!
    let worker: LaunchesWorker = LaunchesWorker()
}

extension LaunchesInteractor: LaunchesInteractorProtocol {
    func getLaunches() {
        worker.get { response in
            self.presenter.showResults(response)
        }
    }
}
