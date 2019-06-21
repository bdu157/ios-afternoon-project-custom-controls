//
//  CustomControl.swift
//  StarRating
//
//  Created by Dongwoo Pae on 6/19/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value : Int = 4
    var labels: [UILabel] = []
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    /*
    override func layoutSubviews() {
        clipsToBounds = true
        layer.cornerRadius = frame.width / 2.0
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.orange.cgColor
    }
 */
    

    
    func setup() {
        
        //for loop
        //create label
        
        //layout label
        
        //setup label - properties of the label -> size, font
        frame = CGRect(origin: .zero, size: intrinsicContentSize)
        print(frame)
        
        for num in 1...componentCount  {
            //create label
            let label = UILabel()
            //layout label
            var number: Int = num * 8
            if number != 8 {
                number = (num * 8) + Int(componentDimension) * (num - 1)
            }
        
            label.frame = CGRect(origin: CGPoint(x: number, y: 100), size: CGSize(width: componentDimension, height: componentDimension))
            print(label.frame)
            //setup label
            
            //label.backgroundColor = .blue
            label.tag = num
            print(label.tag)
            label.text = "✭"
            label.font = UIFont.systemFont(ofSize: 32)
            label.textAlignment = .center
            color(for: label)
            addSubview(label)
            labels.append(label)
            
        }
    }
    private func color(for label: UILabel) {
        label.textColor = componentInactiveColor
        for num in 1...value {
            if let labelWithTag = label.viewWithTag(num) as? UILabel {
                labelWithTag.textColor = componentActiveColor
            }
        }
    }
    
    
    //touch
    
}


//CGPoint, CGRect, CGSize, frame, bounds
