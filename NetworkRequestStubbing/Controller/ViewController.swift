//
//  ViewController.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 20/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Instantiate the HTTP service implementation
    private lazy var service:AddressService = AddressStubService() // AddressHTTPService();
    
    // The outlet connected to the activity indicator view
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the webservice
        self.service.getIPAddress { address in
            // Create an alert to display the address
            let alert = UIAlertController(
                title: "Your IP address..",
                message: "Appears to be \(address)!",
                preferredStyle: .Alert)
            
            // Attach a cancel action button
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            
            // Present the alert to the user
            self.presentViewController(alert, animated: true, completion: nil)
            
            // Stop the indicator
            self.indicator.stopAnimating()
        }
    }
    
}

