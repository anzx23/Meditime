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
        let length = self.view.frame.width / 4.0
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
    
    func start() {
        
        timerPickerView.isHidden = true
        intervalLabel.isHidden = true
        intervalNumberPickerView.isHidden = true
        intervalLabelMin.isHidden = true
        startButton.isHidden = true
        
        minutesLabel.isHidden = false
        seperatorLabel.isHidden = false
        secondsLabel.isHidden = false
        
        pauseButton.isHidden = false
        
        stopButton.isHidden = false
        
        if resume || reset {
            resume = false
            reset = false
            
            stopButton.setTitle("Stop", for: .normal)
            pauseButton.setTitle("Pause", for: .normal)
            
        }
        
        scheduledTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
}
