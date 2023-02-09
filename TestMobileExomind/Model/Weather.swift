//
//  Weather.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import Foundation

struct Weather: Identifiable {
    var id: UUID = UUID()
    var name: String
    var temperature: Double?
    var temperatureString: String {
        guard let temp = temperature else { return "Non disponible" }
        var newTemp = temp
        newTemp.round()
        return "\(Int(newTemp))°C"
    }
    var skyStateCode: Int?
    var image: String {
        renderLogoWeather()
    }
    
    private func renderLogoWeather() -> String {
        if let code = skyStateCode {
            if code >= 200 && code <= 232  {
                return "thunderstorm"
            } else if code >= 300 && code <= 531  {
                return "rain"
            } else if code >= 600 && code <= 622  {
                return "snow"
            } else if code >= 700 && code <= 781  {
                return "mist"
            } else if code == 800 {
                return "clearSky"
            } else if code == 801{
                return "fewClouds"
            } else if code == 802  {
                return "scatteredClouds"
            } else if code == 803 || code == 804  {
                return "cloudy"
            }
        }
        
        return "noImage"
    }
}
