//
//  LaunchWorker.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 17/08/23.
//

import Foundation
import Alamofire

typealias LaunchWorkerResponse = (_ response: LaunchModel.FetchLaunch.Response) -> Void

protocol LaunchWorkerProtocol {
    func get(launchNumber: Int, completion: @escaping LaunchWorkerResponse)
}

class LaunchWorker: LaunchWorkerProtocol {
    func get(launchNumber: Int, completion: @escaping LaunchWorkerResponse) {
        AF.request(Constants.API.launch(launchNumber))
            .validate()
            .responseDecodable(of: Launch.self) { response in
                switch(response.result) {
                case .success(let launch):
                    completion(LaunchModel.FetchLaunch.Response(launch: launch))
                case .failure(let error):
                    completion(LaunchModel.FetchLaunch.Response(launch: nil, error: DataError.netWorkingError(error.localizedDescription)))
                }
                
            }
    }
}
