import Foundation
import MapKit

class LocationManager:NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    // default location coordinates
    @Published var locationCoordinates:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 42, longitude: 29)
    
    //initilaze delegate to update location events
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    // ask user for permission if its not determined
    // if determined then get the location coordinates
    func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            requestLocationPermission()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            locationCoordinates = locationManager.location!.coordinate
            break
        case .authorizedWhenInUse:
            locationCoordinates = locationManager.location!.coordinate
            break
        @unknown default:
            break
        }
    }
    
    // when user declines direct the user to the Settings for your app by passing
    func settingsURL() {
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsURL,options: [:], completionHandler: nil)
        }
    }
    
    // request location permission
    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    // if coordinates changes, it will automaticly update to location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationCoordinates = location.coordinate
        }
    }
    
    // when fails show message to log
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error!")
    }
    
    // updates location authorization
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
