//
//  LaunchesViewModel.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import Foundation

struct LaunchesModel {
    enum FetchLaunches {
         struct Request {}
         
         struct Response {
             var launches: Launches?
             var error: DataError?
         }
         
         struct ViewModel {
             var Launches: [LaunchMapped]
         }
        
        struct ViewModelError {
            var error: String
        }
     }
}

