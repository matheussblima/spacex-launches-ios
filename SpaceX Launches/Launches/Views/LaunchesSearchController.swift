//
//  SearchController.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 08/08/23.
//

import Foundation
import UIKit

class LaunchesSearchController: UISearchController {
    init() {
        super.init(nibName: nil, bundle: nil)
        
        initialSetup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LaunchesSearchController {
    func initialSetup() {
        self.hidesNavigationBarDuringPresentation = false
        self.obscuresBackgroundDuringPresentation = false
        self.searchBar.tintColor = .white
        self.searchBar.barStyle = .black
        self.searchBar.placeholder = "Search Launches"
        self.searchBar.searchBarStyle = .minimal
    }
    
    func layout() {}
}
