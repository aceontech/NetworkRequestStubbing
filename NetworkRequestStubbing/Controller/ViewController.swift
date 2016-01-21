//
//  ViewController.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 20/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getIpViaHTTP(sender: UIButton) {
        self.showIPAddress(AddressHTTPService())
    }
    
    @IBAction func getIpViaStub(sender: UIButton) {
        self.showIPAddress(AddressStubService())
    }
    
    private func showIPAddress(service:AddressService) {
        // Call the webservice
        service.getIPAddress { address in
            // Create an alert to display the address
            let alert = UIAlertController(
                title: "Your IP address..",
                message: "Appears to be \(address)!",
                preferredStyle: .Alert)
            
            // Attach a cancel action button
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            
            // Present the alert to the user
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
}

