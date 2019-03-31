//
//  MainViewController.swift
//  星座
//
//  Created by 方瑾 on 2019/2/15.
//  Copyright © 2019 方瑾. All rights reserved.


import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var goButton: UIButton!
    
    var monthPickerView = UIPickerView()
    var dayPickerView = UIPickerView()
    var monthArray = ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
    var dayArray = ["1日","2日","3日","4日","5日","6日","7日","8日","9日","10日","11日","12日","13日","14日","15日","16日","17日","18日","19日","20日","21日","22日","23日","24日","25日","26日","27日","28日","29日","30日","31日"]
    var singleMonth = ""
    var singleDay = ""
    var xingZuo = ""
    var int = 31
    var month = Int()
    var day = Int()
    var count = Int()
    
    //    "水瓶座", 1/20 ~ 2/18
    //    "双鱼座", 2/19 ~ 3/20
    //    "白羊座", 3/21 ~ 4/19
    //    "金牛座" ,4/20 ~ 5/20
    //    "双子座", 5/21 ~ 6/21
    //    "巨蟹座", 6/22 ~ 7/22
    //    "狮子座", 7/23 ~ 8/22
    //    "处女座", 8/23 ~ 9/22
    //    "天秤座", 9/23 ~ 10/23
    //    "天蝎座", 10/24 ~ 11/22
    //    "射手座", 11/23 ~ 12/21
    //    "摩羯座", 12/22 ~ 1/19
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.inputView = monthPickerView
        inputTextField.inputView = dayPickerView
        monthPickerView.delegate = self
        monthPickerView.dataSource = self
        dayPickerView.delegate = self
        dayPickerView.dataSource = self
        
      
        
    }
//    func choose(num1:Int,num2:Int) -> String {
//        if num1 == 0 {
//            if num2 >= 19 {
//                return "水平座"
//            } else {
//                return "魔蝎座"
//            }
//        } else if num1 == 1 {
//            if num2 >= 18 {
//                return "双鱼座"
//            } else {
//                return "水平座"
//            }
//        } else if num1 == 2 {
//            if num2 >= 20 {
//                return "白羊座"
//            } else {
//                return "双鱼座"
//            }
//        } else if num1 == 3 {
//            if num2 >= 19 {
//                return "金牛座"
//            } else {
//                return "白羊座"
//            }
//        }  else if num1 == 4{
//            if num2 >= 20 {
//                return "双子座"
//            } else {
//                return "金牛座"
//            }
//        } else if num1 == 5 {
//            if num2 >= 21 {
//                return "巨蟹座"
//            } else {
//                return "双子座"
//            }
//        } else if num1 == 6 {
//            if num2 >= 22 {
//                return "狮子座"
//            } else {
//                return "巨蟹座"
//            }
//        } else if num1 == 7 {
//            if num2 >= 22 {
//                return "处女座"
//            } else {
//                return "狮子座"
//            }
//        } else if num1 == 8 {
//            if num2 >= 22 {
//                return "天秤座"
//            } else {
//                return "处女座"
//            }
//        } else if num1 == 9 {
//            if num2 >= 23 {
//                return "天蝎座"
//            } else {
//                return "天秤座"
//            }
//        } else if num1 == 10 {
//            if num2 >= 22 {
//                return "射手座"
//            } else {
//                return "天蝎座"
//            }
//        } else {
//            if num2 >= 21 {
//                return "水瓶座"
//            } else {
//                return "射手座"
//            }
//        }
//
//    }
    func choose(num:Int) -> String {
        count = Int()
        for i in 0...month {
            count += int
        }
        switch count {
        case 20...49:
            return "水平座"//1.31
        case 50...79:
            return "双鱼座"//2.28   59
        case 80...109:
            return "白羊座"//3.31   90
        case 110...140:
            return "金牛座"//4.30  120
        case 141...172:
            return "双子座"//5.31  151
        case 173...203:
            return "巨蟹座"//6.30  181
        case 204...234:
            return "狮子座"//7.31  212
        case 235...265:
            return "处女座"//8.31 243
        case 266...296:
            return "天秤座"//9.30 273
        case 297...326:
            return "天蝎座"//10.31 304
        case 327...355:
            return "射手座"//11.30 334
        default:
            return "摩羯座"
        }
    }
    

    
}
extension MainViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return monthArray.count
        } else {
            return int
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return monthArray[row]
        } else {
            return dayArray[row]
          
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            month = row
            switch monthArray[row] {
            case "1月","3月","5月","7月","8月","10月","12月":
                int = 31
            case "2月":
                int = 28
            default:
                int = 30
            }
            pickerView.reloadComponent(1)
            singleMonth = monthArray[month]
        } else {
            day = row
        }
        singleDay = dayArray[day]
        let xingZuo = choose(num: month)
       
        displayLabel.text = "生日\(singleMonth)\(singleDay),\(xingZuo)"
    }
    
}



