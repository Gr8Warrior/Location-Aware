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
                print("Error getting location data ")
            }else {
                if let placemark = placemarks?[0] {
                    
                    var address = ""
                    if placemark.subThoroughfare != nil{
                        address  += placemark.subThoroughfare! + "\n"
                    }
                    if placemark.thoroughfare != nil{
                        address  += placemark.thoroughfare! + "\n"
                    }
                    if placemark.subAdministrativeArea != nil{
                        address  += placemark.subAdministrativeArea! + "\n"
                    }
                    if placemark.country != nil{
                        address  += placemark.country! + "\n"
                    }
                    
                    self.Address.text = address
                    print("Shailu \(placemark.country!)");
                }
            }
        }
    }
    
}

