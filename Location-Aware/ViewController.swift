//
//  ViewController.swift
//  Location-Aware
//
//  Created by Shailendra Suriyal on 12/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var latitude: UILabel!
    
    @IBOutlet var longitude: UILabel!
    
    @IBOutlet var course: UILabel!
    
    @IBOutlet var speed: UILabel!
    
    @IBOutlet var altitude: UILabel!
    
    @IBOutlet var Address: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

