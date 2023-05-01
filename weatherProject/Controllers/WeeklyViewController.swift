//
//  WeeklyViewController.swift
//  weatherProject
//
//  Created by Defne Çetiner on 30.04.2023.
//

import UIKit
import MapKit

class WeeklyViewController: UITableViewController {

    var weather: Weather?
    let cellIdentifier = "DayWeatherCell"
    let maxDayCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maxDayCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DayWeatherTableViewCell {
            if let weatherData = weather?.data[indexPath.row] {
                cell.update(with: weatherData)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}
