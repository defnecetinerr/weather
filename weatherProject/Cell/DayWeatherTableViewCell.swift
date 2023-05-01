//
//  DayWeatherTableViewCell.swift
//  weatherProject
//
//  Created by Defne Çetiner on 30.04.2023.
//

import UIKit

class DayWeatherTableViewCell: UITableViewCell {
    

        @IBOutlet weak var dayNameLabel: UILabel!
        @IBOutlet weak var iconImageView: UIImageView!
        @IBOutlet weak var maximumTemperatureLabel: UILabel!
        @IBOutlet weak var minimumTemperatureLabel: UILabel!

    func update(with weather: DailyWeather) {
        dayNameLabel.text = DateConfiguration.convertDateToDayName(date: weather.datetime, identifier: "EEEE")
        iconImageView.image = weather.weatherDescription.icon
        maximumTemperatureLabel.text = "\(Int(weather.maxTemperature))"
        minimumTemperatureLabel.text = "\(Int(weather.minTemperature))"
    }
}
