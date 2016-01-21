//
//  AddressService.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 20/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import Foundation

// This protocol defines the web service's contract.
protocol AddressService {
    
    // Gets the IP address of the user and returns it using a callback
    func getIPAddress(callback: (String)->())
    
}