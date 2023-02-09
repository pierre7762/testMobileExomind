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
    
    private let waitingMessages = ["Nous téléchargeons les données...", "C'est presque fini...", "Plus que quelques secondes avant d'avoir le résultat..."]
    
    init() {
        self.currentWaitingMessage = waitingMessages[0]
    }
}
