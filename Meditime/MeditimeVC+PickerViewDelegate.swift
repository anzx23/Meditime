//
//  MeditimeVC+PickerViewDelegate.swift
//  Meditime
//
//  Created by tughral on 2/9/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//


import UIKit

extension MeditimeViewController {
    
    /* Number of Columns */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case is IntervalNumberPickerView:   return 1
        case is TimerPickerView:            return 4
        default:                            return 0
        }
    }
    
    /* Number of Rows in Column */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case is IntervalNumberPickerView:   return PickerViewData.sixtyArrayStr.count
        case is TimerPickerView:
            switch component {
            case 0, 3:                      return 1
            default:                        return PickerViewData.sixtyArrayStr.count
            }
        default:
            return 0
        }
    }
    
    /* Width of Column */
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch pickerView {
        case is IntervalNumberPickerView:   return self.view.frame.width * 0.1
        case is TimerPickerView:
            switch component {
            case 0, 3:                      return self.view.frame.width * 0.3
            default:                        return self.view.frame.width * 0.1
            }
        default:                            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label = UILabel()
        var data = ""
        
        if view is UILabel {
            label = view as! UILabel
        }
        
        switch pickerView {
        case is IntervalNumberPickerView:
            data = PickerViewData.sixtyArrayStr[row]
            let title = NSAttributedString(string: data, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightRegular)])
            label.attributedText = title
            return label
            
        case is TimerPickerView:
            switch component {
            case 0:
                data = TimeUnit.minutes.rawValue
                label.textAlignment = .left
            case 3:
                data = TimeUnit.seconds.rawValue
                label.textAlignment = .right
            default:
                data = PickerViewData.sixtyArrayStr[row]
                switch component {
                case 1:
                    label.textAlignment = .left
                default:
                    label.textAlignment = .right
                }
            }
            let title = NSAttributedString(string: data, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightRegular)])
            label.attributedText = title
            return label
            
        default:    return label
        }
    }
    
    
    
}































