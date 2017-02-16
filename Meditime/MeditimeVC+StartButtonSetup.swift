//
//  MeditimeVC+StartButtonSetup.swift
//  Meditime
//
//  Created by tughral on 1/28/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

extension MeditimeViewController {
    func setupStartButton() {
        startButton.addTarget(nil, action: #selector(start), for: UIControlEvents.touchUpInside)
        let length = self.view.frame.width / 3.7
        let constant = (self.view.frame.width - length) / 2.0
        
        startButton.frame = CGRect(x: 0, y: 0, width: length, height: length)
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.red
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        startButton.clipsToBounds = true
        
        self.view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint(
            item: startButton,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1.0,
            constant: length
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: startButton,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1.0,
            constant: constant
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: startButton,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1.0,
            constant: -constant
        )
        
        let topConstraint = NSLayoutConstraint(
            item: startButton,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1,
            constant: -55
        )
        
        let selfLayoutConstraint = [heightConstraint]
        let layoutConstraints = [leftConstraint, rightConstraint, topConstraint]
        
        startButton.addConstraints(selfLayoutConstraint)
        self.view.addConstraints(layoutConstraints)
    }
}
