//
//  MainViewController+alertController.swift
//  WeatherApp
//
//  Created by Alexandr Dorogov on 29.01.2022.
//

import UIKit

extension MainViewController {
    func showSearchAlertController(title: String, message: String?, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            let cities = ["New-York", "London", "Moscow", "Paris", "Madrid"]
            textField.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let city = textField?.text else { return }
            if city != "" {
                print("Search info fo the \(city)")
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
}
