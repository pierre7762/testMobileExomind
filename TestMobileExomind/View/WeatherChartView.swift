//
//  WeatherChartView.swift
//  TestMobileExomind
//
//  Created by Pierre on 09/02/2023.
//

import SwiftUI

struct WeatherChartView: View {
    var weatherArray: [Weather]
    var body: some View {
        VStack (spacing: -1) {
            ForEach(weatherArray) { weather in
                HStack {
                    VStack {
                        Text(weather.name)
                    }
                    .frame(width: 130, height: 60)
                    VStack {
                        Text(weather.temperatureString)
                    }
                    .frame(width: 80, height: 60)
                    .border(.gray)
                    VStack {
                        Image(uiImage: UIImage(imageLiteralResourceName: weather.image))
                            .resizable()
                            .frame(width: 80, height: 60)
                    }
                }
                .border(.gray)
            }
        }
    }
}

struct weatherChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherChartView(weatherArray: [
            Weather(name: "test1", temperature: 10, skyStateCode: 200),
            Weather(name: "test2", temperature: 20, skyStateCode: 500 )
        ])
    }
}
