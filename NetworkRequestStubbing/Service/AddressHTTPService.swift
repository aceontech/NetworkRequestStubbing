//
//  AddressHTTPService.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 20/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import Foundation
import Alamofire

class AddressHTTPService : AddressService {
    
    func getIPAddress(callback: (String) -> ()) {
        Alamofire.request(.GET, "https://httpbin.org/ip").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value, origin = JSON["origin"] {
                print("JSON: \(JSON)")
                callback(origin as! String)
            }
        }
    }
    
}