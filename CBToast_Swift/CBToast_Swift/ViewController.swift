//
//  Created by c on 2020/7/25.
//  Copyright © 2020 c. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
            
            let btn = UIButton.init(type: .custom)
            btn.frame = CGRect.init(x: 30, y: 90, width: main_width-30*2, height: 40)
            btn.tag = 1
            btn.backgroundColor = UIColor.orange
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.setTitle("正在加载中", for: .normal)
            btn.addTarget(self, action: #selector(showToastAction(sender:)), for: .touchUpInside)
            self.view.addSubview(btn)
            
            let btn1 = UIButton.init(type: .custom)
            btn1.frame = CGRect.init(x: 30, y: btn.frame.maxY+15, width: main_width-30*2, height: 40)
            btn1.tag = 2
            btn1.backgroundColor = UIColor.orange
            btn1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn1.setTitle("请你核对信息之后，再从新下一个单子，然后查看一下订单号码和订单金额是否符合规定，然后就可以测试这个名字很长的啦", for: .normal)
            btn1.addTarget(self, action: #selector(showToastAction(sender:)), for: .touchUpInside)
            self.view.addSubview(btn1)
            
            let btn2 = UIButton.init(type: .custom)
            btn2.frame = CGRect.init(x: 30, y: btn1.frame.maxY+15, width: main_width-30*2, height: 40)
            btn2.tag = 3
            btn2.isSelected = true
            btn2.backgroundColor = UIColor.orange
            btn2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn2.setTitle("菊花旋转", for: .normal)
            btn2.addTarget(self, action: #selector(showToastAction(sender:)), for: .touchUpInside)
            self.view.addSubview(btn2)
            
            let btn3 = UIButton.init(type: .custom)
            btn3.frame = CGRect.init(x: 30, y: btn2.frame.maxY+15, width: main_width-30*2, height: 40)
            btn3.tag = 4
            btn3.isSelected = true
            btn3.backgroundColor = UIColor.orange
            btn3.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn3.setTitle("菊花带消息的正在加载中", for: .normal)
            btn3.addTarget(self, action: #selector(showToastAction(sender:)), for: .touchUpInside)
            self.view.addSubview(btn3)
        
            
            let bottomBtn = UIButton.init(type: .custom)
            bottomBtn.frame = CGRect.init(x: 30, y: main_height-40-30, width: main_width-30*2, height: 40)
            bottomBtn.tag = 100
            bottomBtn.backgroundColor = UIColor.orange
            bottomBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            bottomBtn.setTitle("跳转下一页", for: .normal)
            bottomBtn.addTarget(self, action: #selector(showToastAction(sender:)), for: .touchUpInside)
            self.view.addSubview(bottomBtn)
    }


    @objc func showToastAction(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            CBToast.showToastAction(message: sender.currentTitle! as NSString)
        case 2:
            //根据top，bottom，center来显示位置。 时间3.0s
            CBToast.showToast(message: sender.currentTitle! as NSString, aLocationStr: "bottom", aShowTime: 3.0)
        case 3:
            if sender.isSelected == true {
                CBToast.showToastAction()
            }else{
                CBToast.hiddenToastAction()
            }
            sender.isSelected = !sender.isSelected
        case 4:
            if sender.isSelected == true {
                CBToast.showIndicatorToastAction(message: sender.currentTitle! as NSString)
            }else{
                CBToast.hiddenIndicatorToastAction()
            }
            sender.isSelected = !sender.isSelected
        case 100:
            let bVC = BOViewController.init()
            bVC.modalPresentationStyle = .fullScreen
            self.present(bVC, animated: true, completion: nil)
            
        default:
            break
        }
    }
    
    
}

