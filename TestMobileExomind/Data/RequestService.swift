//
//  RequestService.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import Foundation

enum OpenWeatherError: Error {
    case noData, invalidResponse, undecodableData
}

final class RequestService {
    private let session: AlamoFireSession
    private let api = ApiConstants()
    
    // MARK: Functions
    init(session: AlamoFireSession = OpenWeatherSession()) {
        self.session = session
    }
    
    func getWeatherFromGpsCoordinates(lat: Double, lon: Double, callback: @escaping (Result<WeatherAPI, OpenWeatherError>) -> Void) {
        guard let url = URL(string: "\(self.api.openWeatherBaseUrl)?lat=\(lat)&lon=\(lon)&appid=\(self.api.openWeatherApiKey)&units=metric&lang=fr") else { return }
        session.request(url: url) { dataResponse in
            guard let data = dataResponse.data else {
                callback(.failure(.noData))
                return
            }
            guard dataResponse.response?.statusCode == 200 else {
                callback(.failure(.invalidResponse))
                return
            }
            guard let dataDecoded = try? JSONDecoder().decode(WeatherAPI.self, from: data) else {
                callback(.failure(.undecodableData))
                return
            }
            callback(.success(dataDecoded))
        }
    }
}

