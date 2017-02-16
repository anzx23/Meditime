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
        
        /* Title Image */
        titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 230, height: 80))
        let titleImg: UIImage = #imageLiteral(resourceName: "updated title image copy")
        
        titleImageView.image = titleImg
        titleImageView.contentMode = .scaleAspectFit
        
        
        /* Timer PickerView Map background image*/
        timerPickerImageView = UIImageView(frame: CGRect(x: timerPickerView.frame.origin.x, y: timerPickerView.frame.origin.y, width: timerPickerView.frame.width, height: timerPickerView.frame.height))
        let timerPickerBackgroundImage: UIImage = #imageLiteral(resourceName: "Map")
        timerPickerImageView.image = timerPickerBackgroundImage
        
        timerPickerImageView.contentMode = .scaleAspectFit
        timerPickerImageView.alpha = 0.35

        
        self.view.addSubview(titleImageView)
        self.view.addSubview(timerPickerImageView)
        self.view.addSubview(timerPickerView)
        
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        timerPickerView.translatesAutoresizingMaskIntoConstraints = false
        timerPickerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        /* Constraints */
        
        let titleImgViewWidthConstraint = NSLayoutConstraint(
            item: titleImageView,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.lessThanOrEqual,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1.0,
            constant: timerPickerView.bounds.width * 0.9
        )
        
        let titleImgCenterXConstraint = NSLayoutConstraint(
            item: titleImageView,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: 0
        )
        
        let titleImgTopConstraint = NSLayoutConstraint(
            item: titleImageView,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.topMargin,
            multiplier: 1.0,
            constant: 32
        )
        
        
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
        
        let centerXConstraint = NSLayoutConstraint(
            item: timerPickerView,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: 0
        )
        
        let pickerTopConstraint = NSLayoutConstraint(
            item: timerPickerView,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: titleImageView,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: 20
        )
        
        /* Background Image (Picker) Constraints*/
        let imgViewTopConstraint = NSLayoutConstraint(
            item: timerPickerImageView,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: timerPickerView,
            attribute: NSLayoutAttribute.top,
            multiplier: 1.0,
            constant: -20
        )
        
        let imgViewLeadingConstraint = NSLayoutConstraint(
            item: timerPickerImageView,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.leadingMargin,
            multiplier: 1.0,
            constant: 4
        )
        
        let imgViewTrailingConstraint = NSLayoutConstraint(
            item: timerPickerImageView,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.trailingMargin,
            multiplier: 1.0,
            constant: -4
        )
        
        let viewBottomConstraint = NSLayoutConstraint(
            item: self.bottomLayoutGuide,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: timerPickerImageView,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: 190
        )
        
        
        let selfLayoutConstraints = [widthConstraint, heightConstraint]
        let layoutContraints = [centerXConstraint, pickerTopConstraint, imgViewLeadingConstraint, imgViewTopConstraint, imgViewTrailingConstraint, viewBottomConstraint, titleImgCenterXConstraint, titleImgTopConstraint]//, centerYConstraint
       
        titleImageView.addConstraint(titleImgViewWidthConstraint)
        timerPickerView.addConstraints(selfLayoutConstraints)
        self.view.addConstraints(layoutContraints)
    }

}
