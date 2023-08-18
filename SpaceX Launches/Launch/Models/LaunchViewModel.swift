//
//  LaunchViewModel.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 18/08/23.
//

import Foundation

struct LaunchModel {
    enum FetchLaunch {
         struct Request {}
         
         struct Response {
             var launch: Launch?
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
