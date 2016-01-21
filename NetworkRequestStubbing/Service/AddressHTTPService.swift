//
//  AddressHTTPService.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 20/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import Foundation
import Alamofire
import OHHTTPStubs

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

class AddressHTTPServiceStubs {
    static func loadStubs() {
        // Request is of type NSURLRequest, so you can filter however you want.
        // In this case, we're using the built-in isPath() matcher.
        stub(isPath("/ip")) { request in
            // Use OHPathForFile helper to build the path to the JSON fixture in the main
            // application bundle
            let stubPath = OHPathForFile("ip_response.json", AddressHTTPService.self)
            
            // Create the fixture with the path and set the content type header to JSON
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
        
        OHHTTPStubs.setEnabled(true)
    }
    
    static func unloadStubs() {
        OHHTTPStubs.setEnabled(false)
    }
}