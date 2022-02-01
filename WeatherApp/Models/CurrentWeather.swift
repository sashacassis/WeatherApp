//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Alexandr Dorogov on 01.02.2022.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        String(temperature.rounded())
    }
    
    let feelsLike: Double
    var feelsLikeString: String {
        String(feelsLike.rounded())
    }
    
    let conditionCode: Int
    
    init? (currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLike = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
