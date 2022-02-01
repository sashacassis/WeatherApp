//
//  WeatherNetworkManager.swift
//  WeatherApp
//
//  Created by Alexandr Dorogov on 30.01.2022.
//

import Foundation

struct WheatherNetworkManager {
    func fetchCurrentWeather(for city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apikey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let currentWeather = self.parseJSON(data: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
        let currentWeather = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeather) else {return nil}
            return currentWeather
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
