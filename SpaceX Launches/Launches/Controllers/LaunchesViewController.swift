//
//  LaunchesViewController.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import UIKit

protocol LaunchesViewControllerProtocol {
    func showLaunces(_ launches: LaunchesModel.FetchLaunches.ViewModel)
}

class LaunchesViewController: UIViewController {
    var interactor: LaunchesInteractorProtocol!
    var router: LaunchesRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemOrange
        
        initialSetup()
    }
}

extension LaunchesViewController {
    func initialSetup() {
        self.interactor.getLaunches()
    }
    
    func layout() {}
}

extension LaunchesViewController: LaunchesViewControllerProtocol {
    func showLaunces(_ launchesViewModel: LaunchesModel.FetchLaunches.ViewModel) {
        print("launchesViewModel.Launches \(launchesViewModel)")
    }
}

