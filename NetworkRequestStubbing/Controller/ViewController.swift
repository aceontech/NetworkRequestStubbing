//
//  ViewController.swift
//  NetworkRequestStubbing
//
//  Created by Alex Manarpies on 20/01/16.
//  Copyright © 2016 Jarroo. All rights reserved.
//

import UIKit
import OHHTTPStubs

class ViewController: UIViewController {
    
    lazy var service:AddressService = AddressHTTPService()
    
    // MARK: Outlets
    
    @IBOutlet weak var httpButton: UIButton! {
        didSet {
            self.httpButton.tintColor = UIColor.whiteColor()
            self.httpButton.setBorder(UIColor.whiteColor(), width: 0.5, cornerRadius: 25)
        }
    }
    @IBOutlet weak var stubButton: UIButton! {
        didSet {
            self.stubButton.tintColor = UIColor.whiteColor()
            self.stubButton.setBorder(UIColor.whiteColor(), width: 0.5, cornerRadius: 25)
        }
    }
    
    // MARK: Actions
    
    @IBAction func getIpViaHTTP(sender: UIButton) {
        // Unload any stubs
        AddressHTTPServiceStubs.unloadStubs()
        
        // Print to display
        self.showIPAddress()
    }
    
    @IBAction func getIpViaStub(sender: UIButton) {
        // Load stubs
        AddressHTTPServiceStubs.loadStubs()
        
        // Print to display
        self.showIPAddress()
    }
    
    // MARK: Lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Just some styling...
        let blue = UIColor(red: 16/255, green: 72/255, blue: 109/255, alpha: 1).CGColor
        let green = UIColor(red: 93/255, green: 227/255, blue: 178/255, alpha: 1).CGColor
        
        self.insertBackgroundGradient(
            colors: [blue, green],
            startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1)
        )
    }
    
    // Hide the status bar for this controller
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}


extension ViewController {
    
    func showIPAddress() {
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
        }
    }
    
}


private extension UIButton {
    
    func setBorder(color:UIColor, width:CGFloat, cornerRadius: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.CGColor
        self.layer.cornerRadius = cornerRadius
    }
    
}
