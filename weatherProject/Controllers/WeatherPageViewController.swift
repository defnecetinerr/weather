//
//  WeatherPageViewController.swift
//  weatherProject
//
//  Created by Defne Çetiner on 1.05.2023.
//

import UIKit
import CoreLocation

class WeatherPageViewController: UIPageViewController {
 
    enum Appearance: Int {
        case daily
        case weekly
    }
  
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    lazy var dailyViewController: DailyViewController = {
        return storyboard!.instantiateViewController(identifier: "DailyViewController")
    }()
    
    lazy var weeklyViewController: WeeklyViewController = {
        return storyboard!.instantiateViewController(identifier: "WeeklyViewController")
    }()
    
    var managedControllers: [UIViewController] {
        return [dailyViewController, weeklyViewController]
    }
    let locationManager = CLLocationManager()
    var currentAppearance: Appearance = .daily
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestLocation()
        updateCurrentController(animated: false)
    }
    func updateCurrentController(animated: Bool) {
        switch currentAppearance {
        case .daily:
            setViewControllers([dailyViewController], direction: .reverse, animated: animated, completion: nil)
        case .weekly:
            setViewControllers([weeklyViewController], direction: .forward, animated: animated, completion: nil)
        }
    }

    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        
        if let newAppearance = Appearance(rawValue: segmentedControl.selectedSegmentIndex) {
            currentAppearance = newAppearance
            updateCurrentController(animated: true)
        }
    }
}
extension WeatherPageViewController: CLLocationManagerDelegate {
  
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Uygulamanın konum servislerini kullanma yetkisi yok.")
        case .denied:
            print("Kullanıcı, uygulama için konum servislerinin kullanımını reddetti veya Ayarlar'da genel olarak devre dışı bırakıldı.")
        case .authorizedAlways:
            print("Kullanıcı, istediği zaman konum hizmetini başlatması için uygulamaya izin verdi.")
        case .authorizedWhenInUse:
            print("Kullanıcı, uygulamadayken konum servislerini başlatmasına izi verdi.")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myCoordinate = locations.first?.coordinate {
            let weatherProvider = WeatherProvider()
            
            weatherProvider.getWeather(for: myCoordinate) { (weather) in
                guard let weather = weather else { return }
                
                self.dailyViewController.updateUI(with: weather)
                self.weeklyViewController.weather = weather
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
