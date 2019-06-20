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
        if ratingControl.value == 1 {
            self.navigationItem.title = "User Rating: \(ratingControl.value) star"
        } else {
            self.navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

