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
        setupMinutesLabel()
        countdownTimerSetup()
    }
    
    /* Start Timer */
    func start() {
        toggleViews()
        
        let minutesText = timerPickerView.selectedRow(inComponent: 1)
        let secondsText = timerPickerView.selectedRow(inComponent: 2)
        
        minutesLabel.attributedText = NSAttributedString(string: PickerViewData.sixtyArrayStr[minutesText], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        secondsLabel.attributedText = NSAttributedString(string: PickerViewData.sixtyArrayStr[secondsText], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        
        scheduledTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    /* Update Counter and Counter Labels*/
    func updateCounter() {
        var minutes = Int(minutesLabel.text!)!
        var seconds = Int(secondsLabel.text!)!
        
        switch seconds {
        case 0:
            switch minutes {
            case 0: scheduledTimer.invalidate()
            default:
                minutes -= 1
                seconds = 59
            }
        default: seconds -= 1
        }
        
        minutesLabel.attributedText = NSAttributedString(string: PickerViewData.sixtyArrayStr[minutes], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
        secondsLabel.attributedText = NSAttributedString(string: PickerViewData.sixtyArrayStr[seconds], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 96.0, weight: UIFontWeightBold)])
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func toggleViews() {
        timerPickerView.isHidden = true
        intervalNumberPickerView.isHidden = true
        intervalLabel.isHidden = true
        intervalLabelMin.isHidden = true
        startButton.isHidden = true
        
        minutesLabel.isHidden = false
        seperatorLabel.isHidden = false
        secondsLabel.isHidden = false
    }
    


}
