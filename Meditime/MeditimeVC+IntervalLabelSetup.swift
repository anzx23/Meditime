//
//  MeditimeVC+IntervalLabelSetup.swift
//  Meditime
//
//  Created by tughral on 1/28/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

extension MeditimeViewController {
    func setupIntervalLabel() {
        intervalLabel = UILabel(frame: CGRect(x: 24, y: 337 + 8, width: ((view.frame.width - 16) * 0.7) * 0.6 + 35, height: 50))
        
        view.addSubview(intervalLabel)
        
        intervalLabel.attributedText = NSAttributedString(string: "Inverval bells every", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightRegular)])
        intervalLabel.font = UIFont(name: "Verdana", size: 16)!
        intervalLabel.textAlignment = .left
        intervalLabel.backgroundColor = .clear
        intervalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let widthConstraint = NSLayoutConstraint(
            item: intervalLabel,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.lessThanOrEqual,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1.0,
            constant: ((view.frame.width - 16) * 0.7) * 0.6 + 35
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: intervalLabel,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1.0,
            constant: 50
        )
        
        let topConstraint = NSLayoutConstraint(
            item: intervalLabel,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: timerPickerView,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: 8
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: intervalLabel,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: timerPickerView,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1.0,
            constant: 0
        )
        
        let layoutConstraints = [widthConstraint, heightConstraint, topConstraint, leftConstraint]
        self.view.addConstraints(layoutConstraints)
    }
    
    func setupIntervalLabelMin() {
        let pickerWidth = (view.frame.width - 16) * 0.2
        
        intervalLabelMin = UILabel(frame: CGRect(x: 24 + intervalLabel.frame.width + pickerWidth , y: 337 + 8, width: view.frame.width - (8 + intervalLabel.frame.width) - 8, height: 50))
        
        intervalLabelMin.text = "minutes."
        intervalLabelMin.font = UIFont(name: "Verdana", size: 16)!
        intervalLabelMin.textAlignment = .left
        intervalLabelMin.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(intervalLabelMin)
        
        let heightConstraint = NSLayoutConstraint(
            item: intervalLabelMin,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: intervalLabel,
            attribute: NSLayoutAttribute.height,
            multiplier: 1.0, constant: 0
        )
        
        let firstBaseConstraint = NSLayoutConstraint(
            item: intervalLabelMin,
            attribute: NSLayoutAttribute.firstBaseline,
            relatedBy: NSLayoutRelation.equal,
            toItem: intervalLabel,
            attribute: NSLayoutAttribute.firstBaseline,
            multiplier: 1.0,
            constant: 0
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: intervalLabelMin,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: intervalNumberPickerView,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1.0,
            constant: 0
        )
        
        let layoutConstraints = [heightConstraint, firstBaseConstraint, leftConstraint]
        self.view.addConstraints(layoutConstraints)
    }

}
