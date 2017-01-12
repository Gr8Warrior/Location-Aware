//
//  ViewController.swift
//  Location-Aware
//
//  Created by Shailendra Suriyal on 12/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController , CLLocationManagerDelegate{
    
    var locationManager : CLLocationManager = CLLocationManager()

    @IBOutlet var latitude: UILabel!
    
    @IBOutlet var longitude: UILabel!
    
    @IBOutlet var course: UILabel!
    
    @IBOutlet var speed: UILabel!
    
    @IBOutlet var altitude: UILabel!
    
    @IBOutlet var Address: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SSS loaded")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        latitude.text = String(location.coordinate.latitude)
        longitude.text = String(location.coordinate.longitude)
        course.text = String(location.course);
        speed.text = String(location.speed)
        altitude.text = String(location.altitude)
        
        
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if error != nil {
                
            }else {
                if let placemark = placemarks?[0] {
                    
                    
                    self.Address.text = " \(placemark.subThoroughfare!)  \(placemark.thoroughfare!)  \(placemark.subAdministrativeArea!)  \(placemark.country!) "
                    print("Shailu \(placemark.country!)");
                }
            }
        }
    }
    
}

