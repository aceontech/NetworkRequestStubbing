//
//  AddressStubService.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 21/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import Foundation
import OHHTTPStubs

// Subclass our real HTTP implementation so the HTTP calls are actually made
// OHHTTPStubs will wedge itself between our implementation and iOS's networking stack
class AddressStubService : AddressHTTPService {
    
    override init() {
        super.init()
        
        // Request is of type NSURLRequest, so you can filter however you want.
        // In this case, we're using the built-in isPath() matcher.
        stub(isPath("/ip")) { request in
            // Use OHPathForFile helper to build the path to the JSON fixture in the main 
            // application bundle
            let stubPath = OHPathForFile("ip_response.json", self.dynamicType)
            
            // Create the fixture with the path and set the content type header to JSON
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
    }
    
}