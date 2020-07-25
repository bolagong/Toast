//
//  Created by c on 2020/7/25.
//  Copyright © 2020 c. All rights reserved.
//

import UIKit

class BOViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 30, y: 90, width: main_width-30*2, height: 40)
        btn.tag = 1
        btn.isSelected = true
        btn.backgroundColor = UIColor.orange
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitle("正在加载中", for: .normal)
        btn.addTarget(self, action: #selector(showToastAction(sender:)), for: .touchUpInside)
        self.view.addSubview(btn)
     
        let bottomBtn = UIButton.init(type: .custom)
        bottomBtn.frame = CGRect.init(x: 30, y: main_height-40-30, width: main_width-30*2, height: 40)
        bottomBtn.tag = 100
        
        bottomBtn.backgroundColor = UIColor.orange
        bottomBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        bottomBtn.setTitle("返回上一页", for: .normal)
        bottomBtn.addTarget(self, action: #selector(showToastAction(sender:)), for: .touchUpInside)
        self.view.addSubview(bottomBtn)
    }

    @objc func showToastAction(sender : UIButton) {
        switch sender.tag {
        case 1:
            if sender.isSelected == true {
                CBToast.showIndicatorToastAction(message: sender.currentTitle! as NSString)
            }else{
                CBToast.hiddenIndicatorToastAction()
            }
            sender.isSelected = !sender.isSelected
        case 100:
            self.dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
