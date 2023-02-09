//
//  WeatherViewModel.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import Foundation

class WheatherViewModel: ObservableObject {
    @Published var percentageOfProgression: Int = 0
    @Published var currentProgressionValue = 0.0
    @Published var progressionMaxValueInSeconds = 60.0
    @Published var messageAboveTheProgressBar: String = "Quand est-ce que l'on arrive ?"
    @Published var currentWaitingMessage: String = ""
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var weatherArray: [Weather] = []
    @Published var presenteWeatherResult: Bool = false
    
    private let waitingMessages = ["Nous téléchargeons les données...", "C'est presque fini...", "Plus que quelques secondes avant d'avoir le résultat..."]
    private let requestService: RequestService = RequestService()
    
     //MARK: To test with false coordinates
    //    private let rennes = City(name: "Rennes", latitude: 4800.111339, longitude: -1.68002)
    
    private let rennes = City(name: "Rennes", latitude: 48.111339, longitude: -1.68002)
    private let paris = City(name: "Paris", latitude: 48.85341, longitude:  2.3488)
    private let nantes = City(name: "Nantes", latitude: 47.2186371, longitude: -1.5541362)
    private let bordeaux = City(name: "Bordeaux", latitude: 44.841225, longitude: -0.5800364)
    private let lyon = City(name: "Lyon", latitude: 45.750000, longitude: 4.850000)
    private var waitingMessageIndexToDisplay: Int = 0
    private var timerRun: Bool = true
    
    init() {
        self.currentWaitingMessage = waitingMessages[0]
    }
    
    func incrementCurrentProgressionValue() {
        if timerRun {
            if currentProgressionValue < progressionMaxValueInSeconds {
                sendCityRequestBaseOnTime()
                currentProgressionValue += 1
                updatePercentageProgression()
                changeMessageEverySixSeconds()
            } else {
                if timerRun {
                    timerRun.toggle()
                    presenteWeatherResult.toggle()
                }
            }
        }
    }
    
    func restartTimer() {
        tearDown()
        timerRun = true
    }
    
     private func tearDown() {
        currentProgressionValue = 0
        percentageOfProgression = 0
        weatherArray = []
        presenteWeatherResult = false
        waitingMessageIndexToDisplay = 0
    }
    
    private func updatePercentageProgression() {
        let result = (currentProgressionValue / progressionMaxValueInSeconds) * 100
        percentageOfProgression = Int(result)
    }
    
    private func changeMessageEverySixSeconds() {
        let moduloOfCurrenProgessionValueBySix = Int(currentProgressionValue) % 6
        if moduloOfCurrenProgessionValueBySix == 0 {
            updateMessageIndexToDisplay()
            updateMessage()
        }
    }
    
    private func updateMessageIndexToDisplay() {
        switch waitingMessageIndexToDisplay {
        case 0:
            waitingMessageIndexToDisplay = 1
        case 1:
            waitingMessageIndexToDisplay = 2
        default:
            waitingMessageIndexToDisplay = 0
        }
    }
    
    private func updateMessage() {
        currentWaitingMessage = waitingMessages[waitingMessageIndexToDisplay]
    }
    
    private func sendRequest(name: String, lat: Double, lon: Double) {
        requestService.getWeatherFromGpsCoordinates(lat: lat, lon:  lon) { result in
            switch result {
            case .success(let weather) :
                let weatherCity = Weather(name: weather.name, temperature: weather.main.temp, skyStateCode: weather.weather[0].id)
                self.weatherArray.append(weatherCity)
            case .failure(_):
                let weatherCity = Weather(name: name, temperature: nil, skyStateCode: nil)
                self.weatherArray.append(weatherCity)
                break
            }
        }
    }
    
    private func sendCityRequestBaseOnTime() {
        switch currentProgressionValue {
        case 0:
            sendRequest(name: rennes.name, lat: rennes.latitude, lon: rennes.longitude)
        case 10:
            sendRequest(name: paris.name,lat: paris.latitude, lon: paris.longitude)
        case 20:
            sendRequest(name: nantes.name,lat: nantes.latitude, lon: nantes.longitude)
        case 30:
            sendRequest(name: bordeaux.name,lat: bordeaux.latitude, lon: bordeaux.longitude)
        case 40:
            sendRequest(name: lyon.name,lat: lyon.latitude, lon: lyon.longitude)
        default:
            return
        }
    }
    
}
