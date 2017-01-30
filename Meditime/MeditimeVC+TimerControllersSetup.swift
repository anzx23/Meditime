//
//  MeditimeVC+TimerControllersSetup.swift
//  Meditime
//
//  Created by tughral on 1/29/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

extension MeditimeViewController {
    
    func setupTimerControllers() {
        pauseButton.addTarget(nil, action: #selector(pause), for: UIControlEvents.touchUpInside)
        stopButton.addTarget(nil, action: #selector(stop), for: UIControlEvents.touchUpInside)
        
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.titleLabel?.textAlignment = .center
        pauseButton.backgroundColor = UIColor.red
        pauseButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        pauseButton.clipsToBounds = true
        
        stopButton.setTitle("Stop", for: .normal)
        stopButton.titleLabel?.textAlignment = .center
        stopButton.backgroundColor = UIColor.red
        stopButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        stopButton.clipsToBounds = true
        
        pauseButton.isHidden = true
        stopButton.isHidden = true
        
        self.view.addSubview(pauseButton)
        self.view.addSubview(stopButton)
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint(
            item: pauseButton,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: startButton,
            attribute: NSLayoutAttribute.height,
            multiplier: 1.0,
            constant: 0
        )
        
        let heightConstraint2 = NSLayoutConstraint(
            item: stopButton,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: pauseButton,
            attribute: NSLayoutAttribute.height,
            multiplier: 1.0,
            constant: 0
        )
        
        let widthConstraint = NSLayoutConstraint(
            item: pauseButton,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: startButton,
            attribute: NSLayoutAttribute.width,
            multiplier: 1.0,
            constant: 0
        )
        
        let widthConstraint2 = NSLayoutConstraint(
            item: stopButton,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: pauseButton,
            attribute: NSLayoutAttribute.width,
            multiplier: 1.0,
            constant: 0
        )
        
        let centerXConstraint = NSLayoutConstraint(
            item: pauseButton,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: -(self.view.frame.width / 6)
        )
        
        let centerXConstraint2 = NSLayoutConstraint(
            item: stopButton,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: +(self.view.frame.width / 6)
        )
        
        let yConstraint = NSLayoutConstraint(
            item: pauseButton,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: minutesLabel,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: 175
        )
        
        let yConstraint2 = NSLayoutConstraint(
            item: stopButton,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: minutesLabel,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: 175
        )
        
        let layoutConstraints = [
            heightConstraint,
            widthConstraint,
            centerXConstraint,
            yConstraint,
            centerXConstraint2,
            heightConstraint2,
            widthConstraint2,
            yConstraint2
        ]
        self.view.addConstraints(layoutConstraints)
    }
    
    func pause() {
        if reset {
            timerPickerView.isHidden = false
            intervalLabel.isHidden = false
            intervalNumberPickerView.isHidden = false
            intervalLabelMin.isHidden = false
            startButton.isHidden = false
            
            minutesLabel.isHidden = true
            seperatorLabel.isHidden = true
            secondsLabel.isHidden = true
            
            pauseButton.isHidden = true
            stopButton.isHidden = true
            
            scheduledTimer.invalidate()
        }
        
        resume = true
        stopButton.setTitle("Resume", for: .normal)
        scheduledTimer.invalidate()
        
        reset = true
        pauseButton.setTitle("Reset", for: .normal)
        
    }
    
    func stop() {
        if resume {
            resume = false
            stopButton.setTitle("Stop", for: .normal)
            scheduledTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            
            reset = false
            pauseButton.setTitle("Pause", for: .normal)
        } else {
            print("    else")
            
            timerPickerView.isHidden = false
            intervalLabel.isHidden = false
            intervalNumberPickerView.isHidden = false
            intervalLabelMin.isHidden = false
            startButton.isHidden = false
            minutesLabel.isHidden = true
            seperatorLabel.isHidden = true
            secondsLabel.isHidden = true
            pauseButton.isHidden = true
            stopButton.isHidden = true
            
            scheduledTimer.invalidate()
        }
    }
    
}

