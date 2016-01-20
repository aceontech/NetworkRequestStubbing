//
//  AddressService.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 20/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import Foundation

protocol AddressService {
    // Gets the IP address of the user
    func getIPAddress(callback: (String)->())
}