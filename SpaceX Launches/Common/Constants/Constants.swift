//
//  Constants.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import Foundation

struct Constants {
    static let appName = "SpaceX Launches"
    static let searchPlaceholder = "Launches search"
    static let unexpectedError = "Unexpected error"
    struct API {
       static let baseUrl = "https://api.spacexdata.com/v3"
       static var launches = "\(baseUrl)/launches"
    }
}
