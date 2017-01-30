//
//  MeditimeVC+CountownTimerSetup.swift
//  Meditime
//
//  Created by tughral on 1/28/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

extension MeditimeViewController {
    
    func countdownTimerSetup() {
        
        minutesLabel = time.minutes
        seperatorLabel = time.seperator
        secondsLabel = time.seconds
        
        minutesLabel = UILabel(frame: CGRect(x: 24, y: 400, width: 140, height: 200))
        seperatorLabel = UILabel(frame: CGRect(x: 24 + 70, y: 400, width: 40, height: 200))
        secondsLabel = UILabel(frame: CGRect(x: 24 + 90, y: 400, width: 140, height: 200))
        
        minutesLabel.textAlignment = .center
        seperatorLabel.textAlignment = .center
        secondsLabel.textAlignment = .center
        
        minutesLabel.attributedText = NSAttributedString(string: "10", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        
        seperatorLabel.attributedText = NSAttributedString(string: ":", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        
        secondsLabel.attributedText = NSAttributedString(string: "30", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        
        self.view.addSubview(minutesLabel)
        self.view.addSubview(seperatorLabel)
        self.view.addSubview(secondsLabel)
        
        minutesLabel.translatesAutoresizingMaskIntoConstraints = false
        seperatorLabel.translatesAutoresizingMaskIntoConstraints = false
        secondsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomRightConstraint = NSLayoutConstraint(
            item: secondsLabel,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: seperatorLabel,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: 5
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: secondsLabel,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: seperatorLabel,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1.0,
            constant: 0
        )
        
        let bottomLeftConstraint = NSLayoutConstraint(
            item: minutesLabel,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: seperatorLabel,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: 5
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: minutesLabel,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.equal,
            toItem: seperatorLabel,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1.0,
            constant: 0
        )
        
        let centerXConstraint = NSLayoutConstraint(
            item: seperatorLabel,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: 0
        )
        
        let centerYConstraint = NSLayoutConstraint(
            item: seperatorLabel,
            attribute: NSLayoutAttribute.centerY,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.centerY,
            multiplier: 1.0,
            constant: -150
        )
        
        let seperatorLabelConstraints = [bottomRightConstraint, rightConstraint, leftConstraint, bottomLeftConstraint, centerXConstraint, centerYConstraint]
        self.view.addConstraints(seperatorLabelConstraints)
        
        minutesLabel.isHidden = true
        seperatorLabel.isHidden = true
        secondsLabel.isHidden = true
    }
    
    func updateCounter() {
        var countdownMinutes = -1
        var countdownSeconds = -1
        
        countdownMinutes = Int(minutesLabel.text!)!
        countdownSeconds = Int(secondsLabel.text!)!
        
        
        if countdownSeconds > 0 {
            secondsLabel.attributedText = NSAttributedString(string: "\(String(countdownSeconds - 1))", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        } else if countdownSeconds == 0 {
            
            if countdownMinutes > 0 {
                
                minutesLabel.attributedText = NSAttributedString(string: "\(String(countdownMinutes - 1))", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
                
                secondsLabel.attributedText = NSAttributedString(string: "\(59)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
            } else {
                scheduledTimer.invalidate()
            }
            
        }
    }

}
