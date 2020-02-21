//
//  CoreLocationSection.swift
//  CoreLocationDemoFeb21
//
//  Created by Margiett Gil on 2/21/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
import CoreLocation

class CoreLocationSession: NSObject {
    public var locationManger: CLLocationManager
    
    override init(){
        
        locationManger = CLLocationManager()
        super.init()
        locationManger.delegate = self
        
        // request the user's location
        locationManger.requestAlwaysAuthorization()
        locationManger.requestWhenInUseAuthorization()

        // the following keys needs to be added to the info.plist file
        /*
         NSLocationAlwaysAndWhenInUseUsageDescription
         NSLocationWhenInUseUsageDescription


         */
        
        // get updates for user location
        locationManger.startUpdatingLocation()
    }
}

extension CoreLocationSession: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations\(locations)")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
            
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .denied:
            print("denied")
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion")
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion")
    }
}
