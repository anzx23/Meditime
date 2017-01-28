//
//  MeditimeVC+MinutesLabelSetup.swift
//  Meditime
//
//  Created by tughral on 1/28/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

extension MeditimeViewController {
    func setupMinutesLabel() {
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
