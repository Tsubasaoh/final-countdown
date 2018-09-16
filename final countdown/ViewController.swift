//
//  ViewController.swift
//  final countdown
//
//  Created by 王奕功 on 2018/9/11.
//  Copyright © 2018年 王奕功. All rights reserved.
//

import UIKit
//時光是琥珀～貴得很先設好optional
var timer: Timer?
var goal: Date!
var now: Date!

class ViewController: UIViewController {
    //時光飛逝歲月如梭
    @IBOutlet weak var datePickerValue: UIDatePicker!
    @IBOutlet weak var countTextField: UITextField!
    @IBOutlet weak var chargeTextField: UITextField!
    @IBOutlet weak var nowTextField: UITextField!
    //時光不能倒流,日期鎖死在今天
    override func viewDidLoad() {
        datePickerValue.minimumDate = Date()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        func didReceiveMemoryWarning(){
            super.didReceiveMemoryWarning()
        }
        func viewDidDisappear(_ animated: Bool) {
            if timer != nil {
                timer?.invalidate()
            }
        }
    }
    @IBAction func datePickerValue(_ sender: UIDatePicker) {
        goal = sender.date
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let time = formatter.string(from: today)
        self.nowTextField.text = time
        //計算信仰加值日間隔
        let interval = goal.timeIntervalSince(today)
        chargeTextField.text = formatter.string(from: datePickerValue.date)
        //換算秒數為分，時，日再把日期從浮點數變整數
        let integerinterval = Int(interval/60/60/24+1)
        countTextField.text = ("\(integerinterval)")
        print(integerinterval)
        //得出答案收鍵盤～！
        view.endEditing(true)
    }
}

