//
//  MapViewController.swift
//  MapKit1
//
//  Created by Mauro Arantes on 17/12/2021.
//

import UIKit
import MapKit
//import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    /*
     You use instances of this class to configure, start, and stop the Core Location services. A location manager object supports the following location-related activities:
     Tracking large or small changes in the user’s current location with a configurable degree of accuracy.
     Reporting heading changes from the onboard compass.
     Monitoring distinct regions of interest and generating location-based events when the user enters or leaves those regions.
     Reporting the range to nearby beacons
     */
    var RU: RandomUser?
    private let locationManager = CLLocationManager()
    private let userRadiusInMeters: Double = 1000000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        grokUserLocation()
    }
    
    /*
     in your simulator you can simulate location by selecting the simulator and from the top menu select Debug -> Simulate Location
     ATL lat: 33.749, long: 84.3880
     Lon lat: 51.5072, long: 0.1276
     Rio 22.9068° S, 43.1729
     */
   
    /*
     Core Location Framework: Coore Location provides services that determine a device's geographic location, altitude, and orientation, or its position relative to a nearby iBeacon device. The framework gathers data using all available components on the device, including the Wi-Fi, GPS, Bluetooth, magnometer, barometer and cellular hardware
     https://developer.apple.com/documentation/corelocation
     What's new in Location WWDC '20
     https://developer.apple.com/videos/play/wwdc2020/10660
     */
    
    private func grokUserLocation() {
        let lat = (RU!.results[0].location.coordinates.latitude as NSString).doubleValue
        let lon = (RU!.results[0].location.coordinates.longitude as NSString).doubleValue
        let location = CLLocationCoordinate2D(latitude: lat as CLLocationDegrees, longitude: lon as CLLocationDegrees)
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: userRadiusInMeters, longitudinalMeters: userRadiusInMeters)
        mapView.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = location
        mapView.addAnnotation(pin)
    }
}

