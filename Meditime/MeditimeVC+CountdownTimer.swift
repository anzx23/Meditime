//
//  MeditimeVC+CountdownTimer.swift
//  Meditime
//
//  Created by tughral on 2/9/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

extension MeditimeViewController {
    
    func hideTimer() {
        /* Hide Display View*/
        print("hide")
        timerScreenCover = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        timerScreenCover.backgroundColor = UIColor.black
        self.view.addSubview(timerScreenCover)
    }
    
    func countdownTimerSetup() {

        /* Hide Display Button */
        hideTimerScreenButton.addTarget(nil, action: #selector(hideTimer), for: UIControlEvents.touchUpInside)
        hideTimerScreenButton.frame = CGRect(x: 0, y: 0, width: 200, height: 75)
        hideTimerScreenButton.setTitle("Hide Display", for: .normal)
        hideTimerScreenButton.backgroundColor = UIColor.gray
        hideTimerScreenButton.layer.cornerRadius = 5
        hideTimerScreenButton.clipsToBounds = true
        
        
        /* Countdown Timer Labels */
        minutesLabel = UILabel(frame: CGRect(x: 24, y: 400, width: 140, height: 200))
        seperatorLabel = UILabel(frame: CGRect(x: 24 + 70, y: 400, width: 40, height: 200))
        secondsLabel = UILabel(frame: CGRect(x: 24 + 90, y: 400, width: 140, height: 200))
        
        minutesLabel.textAlignment = .center
        seperatorLabel.textAlignment = .center
        secondsLabel.textAlignment = .center
        
        minutesLabel.attributedText = NSAttributedString(string: "10", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        
        seperatorLabel.attributedText = NSAttributedString(string: ":", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        
        secondsLabel.attributedText = NSAttributedString(string: "30", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        
        
        /* Add Subviews */
        self.view.addSubview(timerScreenCover)
        self.view.addSubview(hideTimerScreenButton)
        self.view.addSubview(minutesLabel)
        self.view.addSubview(seperatorLabel)
        self.view.addSubview(secondsLabel)

        
        /* Disable AutoLayout */
        hideTimerScreenButton.translatesAutoresizingMaskIntoConstraints = false
        minutesLabel.translatesAutoresizingMaskIntoConstraints = false
        seperatorLabel.translatesAutoresizingMaskIntoConstraints = false
        secondsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let hideTimerBtnCenterXConstraint = NSLayoutConstraint(
            item: hideTimerScreenButton,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: 0
        )
        
        let hideTimerBtnBottomConstraint = NSLayoutConstraint(
            item: hideTimerScreenButton,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.bottomLayoutGuide,
            attribute: NSLayoutAttribute.top,
            multiplier: 1.0,
            constant: -16
        )
        
        
        
        
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
        
        let seperatorLabelConstraints = [bottomRightConstraint, rightConstraint, leftConstraint, bottomLeftConstraint, centerXConstraint, centerYConstraint, hideTimerBtnCenterXConstraint, hideTimerBtnBottomConstraint]//, hideScreenCoverCenterXConstraint, hideScreenCoverCenterYConstraint]
        self.view.addConstraints(seperatorLabelConstraints)
        
        hideTimerScreenButton.isHidden = true
        minutesLabel.isHidden = true
        seperatorLabel.isHidden = true
        secondsLabel.isHidden = true
    }
}
