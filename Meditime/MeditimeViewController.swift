//
//  MeditimeViewController.swift
//  Meditime
//
//  Created by tughral on 1/25/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

enum TimeUnit: String {
    case minutes = "minutes"
    case seconds = "seconds"
}

struct PickerViewData {
    static let sixtyArrayInt: [Int] = [00, 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59]
    
    static let sixtyArrayStr: [String] = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]
}

class MeditimeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    /* UIPickerView */
    var timerPickerView: UIPickerView = TimerPickerView()
    let intervalNumberPickerView = IntervalNumberPickerView()
    
    /* UIButton */
    let startButton = UIButton()
    
    /* UILabel */
    var intervalLabel = UILabel()
    var intervalLabelMin = UILabel()
    var minutesLabel = UILabel()
    var seperatorLabel = UILabel()
    var secondsLabel = UILabel()
    
    /* Countdown Timer */
    var scheduledTimer = Timer()
    
    /* Timer Controllers */
    var pauseButton = UIButton()
    var stopButton = UIButton()
    var doneButton = UIButton()
    
    /* PickerView BackgroundImage*/
    var titleImageView = UIImageView()
    var timerPickerImageView = UIImageView()
    
    /* Hiding Timer Screen */
    var timerScreenCover = UIView()
    var hideTimerScreenButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    /* Setup Views */
    func setupViews() {
        setupStartButton()
        setupTimerPickerView()
        setupIntervalLabel()
        setupIntervalNumberPickerView()
        setupIntervalLabelMin()
 
        countdownTimerSetup()
        setupTimerControllers()
        
    }
    
    /* Start Timer */
    func start() {
        toggleViews()
        
        let minutesText = timerPickerView.selectedRow(inComponent: 1)
        let secondsText = timerPickerView.selectedRow(inComponent: 2)
        
        minutesLabel.attributedText = NSAttributedString(string: PickerViewData.sixtyArrayStr[minutesText], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 86.0, weight: UIFontWeightBold)])
        secondsLabel.attributedText = NSAttributedString(string: PickerViewData.sixtyArrayStr[secondsText], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 86.0, weight: UIFontWeightBold)])
        
        scheduledTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    /* Update Counter and Counter Labels*/
    func updateCounter() {
        //print("updateCounter called")
        var minutes = Int(minutesLabel.text!)!
        var seconds = Int(secondsLabel.text!)!
        
        switch seconds {
        case 0:
            switch minutes {
            case 0: stop()
            default:
                minutes -= 1
                seconds = 59
            }
        default: seconds -= 1
        }
        
        minutesLabel.attributedText = NSAttributedString(string: PickerViewData.sixtyArrayStr[minutes], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 86.0, weight: UIFontWeightBold)])
        secondsLabel.attributedText = NSAttributedString(string: PickerViewData.sixtyArrayStr[seconds], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 86.0, weight: UIFontWeightBold)])
    }
    
    /* Hide or Show Views */
    func toggleViews() {
        timerPickerView.isHidden = true
        intervalNumberPickerView.isHidden = true
        intervalLabel.isHidden = true
        intervalLabelMin.isHidden = true
        startButton.isHidden = true
        timerPickerImageView.isHidden = true
        titleImageView.isHidden = true
        
        hideTimerScreenButton.isHidden = false
        minutesLabel.isHidden = false
        seperatorLabel.isHidden = false
        secondsLabel.isHidden = false
        pauseButton.isHidden = false
        stopButton.isHidden = false
    }
    
    
    func pause() {
        let currentTitle = pauseButton.currentTitle!
        switch currentTitle {
        case "Pause":
            scheduledTimer.invalidate()
            pauseButton.setTitle("Continue",for: .normal)
            pauseButton.backgroundColor = .green
        case "Continue":
            scheduledTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            pauseButton.setTitle("Pause",for: .normal)
            pauseButton.backgroundColor = .orange
        default:
            print("pause() error")
        }
    }
    
    func stop() {
        scheduledTimer.invalidate()
        pauseButton.isHidden = true
        stopButton.isHidden = true
        doneButton.isHidden = false
        
    }
    
    func done() {
        timerPickerView.isHidden = false
        intervalNumberPickerView.isHidden = false
        intervalLabel.isHidden = false
        intervalLabelMin.isHidden = false
        startButton.isHidden = false
        timerPickerImageView.isHidden = false
        titleImageView.isHidden = false
        
        doneButton.isHidden = true
        minutesLabel.isHidden = true
        seperatorLabel.isHidden = true
        secondsLabel.isHidden = true
    }
    
    func setupTimerControllers() {
        pauseButton.addTarget(nil, action: #selector(pause), for: UIControlEvents.touchUpInside)
        stopButton.addTarget(nil, action: #selector(stop), for: UIControlEvents.touchUpInside)
        doneButton.addTarget(nil, action: #selector(done), for: UIControlEvents.touchUpInside)

        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.titleLabel?.textAlignment = .center
        pauseButton.backgroundColor = UIColor.orange
        pauseButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        pauseButton.clipsToBounds = true
        
        stopButton.setTitle("Stop", for: .normal)
        stopButton.titleLabel?.textAlignment = .center
        stopButton.backgroundColor = UIColor.red
        stopButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        stopButton.clipsToBounds = true
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.textAlignment = .center
        doneButton.backgroundColor = UIColor.blue
        doneButton.layer.cornerRadius = 25
        doneButton.clipsToBounds = true
        
        pauseButton.isHidden = true
        stopButton.isHidden = true
        doneButton.isHidden = true
        
        self.view.addSubview(pauseButton)
        self.view.addSubview(stopButton)
        self.view.addSubview(doneButton)
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        let doneHeightConstraint = NSLayoutConstraint(
            item: doneButton,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: pauseButton,
            attribute: NSLayoutAttribute.height,
            multiplier: 0.75,
            constant: 0
        )
        
        let doneWidthConstraint = NSLayoutConstraint(
            item: doneButton,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: startButton,
            attribute: NSLayoutAttribute.width,
            multiplier: 1.5,
            constant: 0
        )
        
        let doneCenterXConstraint = NSLayoutConstraint(
            item: doneButton,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: 0
        )
        
        let doneBottomConstraint = NSLayoutConstraint(
            item: doneButton,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: -100
        )
        
        let layoutConstraints = [
            heightConstraint,
            widthConstraint,
            centerXConstraint,
            yConstraint,
            centerXConstraint2,
            heightConstraint2,
            widthConstraint2,
            yConstraint2,
            doneHeightConstraint,
            doneWidthConstraint,
            doneCenterXConstraint,
            doneBottomConstraint
        ]
        self.view.addConstraints(layoutConstraints)
    }
    
}
