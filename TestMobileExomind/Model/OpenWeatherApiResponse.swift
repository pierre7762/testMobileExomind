//
//  OpenWeatherApiResponse.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import Foundation

// MARK: - Weather
struct WeatherAPI: Decodable {
    let weather: [WeatherElement]
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Decodable {
    let temp: Double
}

// MARK: - WeatherElement
struct WeatherElement: Decodable {
    let id: Int
}
