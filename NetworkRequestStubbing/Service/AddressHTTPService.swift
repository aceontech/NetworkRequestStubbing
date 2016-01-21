//
//  AddressHTTPService.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 20/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import Foundation
import Alamofire

// Adopt the AddressService protocol
class AddressHTTPService : AddressService {
    
    func getIPAddress(callback: (String) -> ()) {
        // Use Alamofire to build and send a simple HTTP JSON request to httpbin.org
        // When no stubbing is enabled, the /ip endpoint simply returns the IP address of
        // the requester.
        Alamofire.request(.GET, "https://httpbin.org/ip").responseJSON { response in
            if let JSON = response.result.value, origin = JSON["origin"] {
                print("JSON: \(JSON)")
                callback(origin as! String)
            }
        }
    }
    
}