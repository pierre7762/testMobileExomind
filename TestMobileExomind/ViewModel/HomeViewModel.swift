//
//  HomeViewModel.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var title: String = "Application de test pour EXOMIND"
    @Published var buttonTitle: String = "Voir la météo"
}
