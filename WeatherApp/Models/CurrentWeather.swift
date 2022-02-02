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
    var systemIconString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.heavyrain"
        case 600...622: return "snow"
        case 701...781: return "smoke"
        case 800: return "sun.max"
        case 801...804: return "cloud"
        default: return "nosign"
        }
    }
    
    init? (currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLike = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
