//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alexandr Dorogov on 29.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    let weatherNetworkManager = WheatherNetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherNetworkManager.fetchCurrentWeather(for: "London") { currentWeather in
            DispatchQueue.main.async {
                self.updateInteface(currentWeather: currentWeather)
            }
        }
    }

    @IBAction func pressChangeCityButton(_ sender: UIButton) {
        showSearchAlertController(title: "Enter your city", message: nil, style: .alert){ city in
            self.weatherNetworkManager.fetchCurrentWeather(for: city) {currentWeather in
                DispatchQueue.main.async {
                    self.updateInteface(currentWeather: currentWeather)
                }
            }
        }
    }
    
    func updateInteface(currentWeather: CurrentWeather) {
        self.cityLabel.text = currentWeather.cityName
        self.temperatureLabel.text = currentWeather.temperatureString
        self.feelsLike.text = currentWeather.feelsLikeString
        self.weatherImageView.image = UIImage(systemName: currentWeather.systemIconString)
    }
    
}

