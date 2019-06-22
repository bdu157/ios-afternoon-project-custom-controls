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
        
    }
*/
    
    func setup() {
        
        //for loop
        //create label
        
        //layout label
        
        //setup label - properties of the label -> size, font
        //frame = CGRect(origin: .zero, size: intrinsicContentSize)
        print(frame)
        
        for num in 1...componentCount  {
            //create label
            let label = UILabel()
            //layout label
            addSubview(label)
            var number: Int = num * 8
            if number != 8 {
                number = (num * 8) + Int(componentDimension) * (num - 1)
            }
        
            label.frame = CGRect(origin: CGPoint(x: number, y: 0), size: CGSize(width: componentDimension, height: componentDimension))
            print(label.frame)
            
            //setup label
            
            //label.backgroundColor = .blue
            label.tag = num-1
            print(label.tag)
            label.text = "✭"
            label.font = UIFont.systemFont(ofSize: 32)
            label.textAlignment = .center
            label.textColor = componentInactiveColor
            if let firstLabel = label.viewWithTag(0) as? UILabel {
                firstLabel.textColor = componentActiveColor
            }
            labels.append(label)
        }
    }
    
    //Touch Handlers
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("begining tracking")
        self.updateValue(at: touch)
        //sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("continue tracking")
      //  let touchPoint = touch.location(in: self)
      //  if bounds.contains(touchPoint) {
            self.updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
            print("touch drag inside")
      //  } else {
//            sendActions(for: [.touchDragOutside])
//            print("touch drag ouside")
      //  }
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
        for x in labels {
            if x.frame.contains(touchPoint) {
                value = x.tag
                print(value)
                for num in value...4 {
                    labels[num].textColor = componentInactiveColor
                }
                setupStarColorToActive()
                }
            }
        }
    
    func setupStarColorToActive() {
        for num in 0...value {
                labels[num].textColor = componentActiveColor
            }
    }
}

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}
//CGPoint, CGRect, CGSize, frame, bounds
