//
//  LaunchViewController.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 17/08/23.
//

import Foundation
import UIKit

class LaunchViewController: UIViewController {
    
    var interactor: LaunchInteractor!
    var router: LaunchRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        layout()
    }
}

extension LaunchViewController {
    func initialSetup() {}
    
    func layout() {}
}
