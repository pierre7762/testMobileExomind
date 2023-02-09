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
            
            
            ProgressView(value: vm.currentProgressionValue, total: vm.progressionMaxValueInSeconds) {
                
            }
            .padding(.horizontal)
            
            Text("\(vm.percentageOfProgression) %")
                .padding(.horizontal)
        }
        .navigationBarTitle(Text("Météo"), displayMode:.inline)
        .toolbarBackground(
            Color.white,
            for: .navigationBar
        )
        .onReceive(vm.timer) { _ in
            vm.incrementCurrentProgressionValue()
        }
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
