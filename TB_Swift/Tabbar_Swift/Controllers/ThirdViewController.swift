//
//  ThirdViewController.swift
//  Tabbar_Swift
//
//  Created by zjwang on 16/6/7.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    var dismissViewControllerBlock: (() -> ()) = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
        let btn = UIButton.init(type: UIButtonType.Custom)
        btn.frame = CGRectMake(20, 20, 40, 40)
        self.view.addSubview(btn)
        btn.backgroundColor = UIColor.blackColor()
        btn.addTarget(self, action: #selector(ThirdViewController.click), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    func click() {
        dismissViewControllerBlock()
        self.dismissViewControllerAnimated(true) { 
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
