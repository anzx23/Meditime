//
//  MeditimeVC-IntervalNumberPickerViewSetup.swift
//  Meditime
//
//  Created by tughral on 1/28/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

extension MeditimeViewController {
    func setupIntervalNumberPickerView() {
        intervalNumberPickerView.dataSource = self
        intervalNumberPickerView.delegate = self
        
        intervalNumberPickerView.layer.borderColor = UIColor(colorLiteralRed: 143/255, green: 142/255, blue: 148/255, alpha: 0.3).cgColor
        intervalNumberPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(intervalNumberPickerView)
        
        let baselineConstraint = NSLayoutConstraint(
            item: intervalNumberPickerView,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: intervalLabel,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: 0
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: intervalNumberPickerView,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: intervalLabel,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1.0,
            constant: 0
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: intervalNumberPickerView,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: intervalLabel,
            attribute: NSLayoutAttribute.height,
            multiplier: 1.0,
            constant: 0
        )
        
        let widthConstraint = NSLayoutConstraint(
            item: intervalNumberPickerView,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1.0,
            constant: 50
        )
        
        let selfLayoutConstraints = [widthConstraint]
        let layoutConstraints = [baselineConstraint, leftConstraint, heightConstraint]
        
        intervalNumberPickerView.addConstraints(selfLayoutConstraints)
        self.view.addConstraints(layoutConstraints)
        
    }

}
