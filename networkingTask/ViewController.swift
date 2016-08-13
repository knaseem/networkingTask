//
//  ViewController.swift
//  networkingTask
//
//  Created by naseem on 13/08/2016.
//  Copyright © 2016 naseem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sharedSession = NSURLSession.sharedSession()
        
        if let URL = NSURL(string: "http://bit.ly/2b5Wmkz") {
            // Create Request
            let request = NSURLRequest(URL: URL)
            
            // Create Data Task
            let dataTask = sharedSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if let data = data, let image = UIImage(data: data) {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.imageView.image = image
                    })
                }
            })
            
            dataTask.resume()
        }
    }

}

