//
//  WeatherView.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var vm: WheatherViewModel = WheatherViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text(vm.currentWaitingMessage)
                .font(.subheadline)
                
            Spacer()
            Text(vm.messageAboveTheProgressBar)
                .font(.title2)
            
            HStack {
                ProgressView(value: vm.currentProgressionValue, total: vm.progressionMaxValueInSeconds) {
                    
                }
                .padding(.horizontal)
                Text("\(vm.percentageOfProgression) %")
                Spacer()
            }
        }
        .navigationBarTitle(Text("Météo"), displayMode:.inline)
        .toolbarBackground(
            Color.white,
            for: .navigationBar
        )
        .toolbarBackground(.visible, for: .navigationBar)
                
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
