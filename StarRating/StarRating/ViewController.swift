//
//  ViewController.swift
//  StarRating
//
//  Created by Dongwoo Pae on 6/19/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        //ratingControl.setup()
        let ratingNum = ratingControl.value + 1
        if ratingNum == 1 {
            self.title = "User Rating: \(ratingNum) star"
        } else {
            self.title = "User Rating: \(ratingNum) stars"
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
}

