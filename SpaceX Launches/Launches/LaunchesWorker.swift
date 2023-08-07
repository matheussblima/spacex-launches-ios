//
//  LaunchesWorker.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 05/08/23.
//

import Foundation
import Alamofire

typealias LaunchesWorkerResponse = (_ response: LaunchesModel.FetchLaunches.Response) -> Void

protocol LaunchesWorkerProtocol {
    func get(completion: @escaping LaunchesWorkerResponse) -> Void
}

class LaunchesWorker: LaunchesWorkerProtocol {
    func get(completion: @escaping LaunchesWorkerResponse) {
        AF.request(Constants.API.launches).responseDecodable(of: Launches.self) { response in
            switch response.result {
            case .success(let launches):
                completion(LaunchesModel.FetchLaunches.Response(launches: launches))
            case .failure(let error):
                print(error)
                completion(LaunchesModel.FetchLaunches.Response(launches: nil, error: DataError.netWorkingError(error.localizedDescription)))
            }
            
        }
    }
}
