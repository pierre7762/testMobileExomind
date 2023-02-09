//
//  OpenWeatherSession.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import Foundation
import Alamofire

protocol AlamoFireSession {
    func request(url: URL, callback: @escaping (AFDataResponse<Data?>) -> Void)
}

final class OpenWeatherSession: AlamoFireSession {
    func request(url: URL, callback: @escaping (AFDataResponse<Data?>) -> Void) {

        AF.request(url).response { response in
            callback(response)
        }
    }
}
