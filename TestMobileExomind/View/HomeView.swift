//
//  HomeView.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Text(vm.title)
                    .font(.title2)
                NavigationLink {
                    WeatherView()
                } label: {
                    Text(vm.buttonTitle)
                        .padding()
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color("exomind"))
                        .cornerRadius(12)
                }
            }
        }
        .navigationBarTitle("Accueil", displayMode: .inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
