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
    var value : Int = 1
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
            label.textColor = componentInactiveColor
            if let firstLabel = label.viewWithTag(1) as? UILabel {
                firstLabel.textColor = componentActiveColor
            }
            addSubview(label)
            labels.append(label)
            
        }
    }
    
    //Touch Handlers
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("begining tracking")
        self.updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("continue tracking")
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            self.updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
            print("touch drag inside")
        } else {
            sendActions(for: [.touchDragOutside])
            print("touch drag ouside")
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        print("end tracking")
    
        guard let touch = touch else {return}
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            self.updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
            print("touch up outside")
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        print("cancel tracking")
        sendActions(for: [.touchCancel])
    }
    
    private func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        print(touchPoint)
        //something.contains(touchPoint)  to see if touchPoint is contained in
        for label in labels {
            if label.frame.contains(touchPoint) {
                value = label.tag
                
                }
            }
        }
    
    func setupStarColor(for label: UILabel) {  //this changes the color of label inside of lables array because of the tag being recognized for change?
        for num in 0...label.tag - 1 {
            if let labelWithTag = labels[num].viewWithTag(num+1) as? UILabel {
                labelWithTag.textColor = componentActiveColor
            }
        }
    }
}


//CGPoint, CGRect, CGSize, frame, bounds
