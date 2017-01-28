//
//  MeditimeVC+TimerPickerViewSetup.swift
//  Meditime
//
//  Created by tughral on 1/28/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//
import UIKit

extension MeditimeViewController {
    func setupTimerPickerView() {
        
        timerPickerView.dataSource = self
        timerPickerView.delegate = self
        
        timerPickerView.selectRow(10, inComponent: 1, animated: true)
        timerPickerView.selectRow(30, inComponent: 2, animated: true)
        
        timerPickerView.layer.borderColor = UIColor(colorLiteralRed: 143/255, green: 142/255, blue: 148/255, alpha: 0.3).cgColor
        timerPickerView.layer.borderWidth = 1
        timerPickerView.layer.cornerRadius = 15
        timerPickerView.backgroundColor = .clear
        timerPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(timerPickerView)
        
        let heightConstant = self.view.frame.height / 3.5
        let horizontalConstant = (self.view.frame.width - (self.view.frame.width * 0.92)) / 2.0
        let widthConstant = self.view.frame.width - (2 * horizontalConstant)
        
        let widthConstraint = NSLayoutConstraint(
            item: timerPickerView,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.lessThanOrEqual,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1.0,
            constant: widthConstant
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: timerPickerView,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1.0,
            constant: heightConstant
        )
        
        let topConstraint = NSLayoutConstraint(
            item: timerPickerView,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.top,
            multiplier: 1,
            constant: 50
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: timerPickerView,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1.0,
            constant: -horizontalConstant
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: timerPickerView,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1.0,
            constant: horizontalConstant
        )
        
        let selfLayoutConstraints = [widthConstraint, heightConstraint]
        let layoutContraints = [topConstraint, rightConstraint, leftConstraint]
        
        timerPickerView.addConstraints(selfLayoutConstraints)
        self.view.addConstraints(layoutContraints)
    }

}
