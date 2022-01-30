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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressChangeCityButton(_ sender: UIButton) {
        showSearchAlertController(title: "Enter your city", message: nil, style: .alert)
    }
    
}

