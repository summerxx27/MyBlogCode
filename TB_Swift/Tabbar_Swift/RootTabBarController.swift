//
//  RootTabBarController.swift
//  Tabbar_Swift
//
//  Created by zjwang on 16/6/7.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    let btnIndexCenter = 2
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addAllChildViewController()
    }

}
// MARK: - 添加子控制器
extension RootTabBarController{
    func addAllChildViewController() -> Void {
        // 主页
        addChildVC(FirstViewController(), title: "首页", image: "tabbar_home", selectedImage: "tabbar_home_selected")
        addChildVC(SecondViewController(), title: "消息", image: "tabbar_message_center", selectedImage: "tabbar_message_center_highlighted")
        addCenterButton("tabbar_compose_button", title: "+")
        addChildVC(FourViewController(), title: "发现", image: "tabbar_discover", selectedImage: "tabbar_discover_selected")
        addChildVC(FifViewController(), title: "我", image: "tabbar_profile", selectedImage: "tabbar_profile_selected")
    }
    
    func addChildVC(childVC: UIViewController, title: String, image: String, selectedImage: String) -> Void {
        //
        childVC.tabBarItem.title = title
        //
        childVC.tabBarItem.image = UIImage(named: image)
        //
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        // 设置点击之后的字体颜色
        childVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor ( red: 1.0, green: 0.503, blue: 0.0028, alpha: 1.0 )], forState: UIControlState.Selected)
        // 设置导航控制器
        let childNav = UINavigationController.init(rootViewController: childVC)
        addChildViewController(childNav)
    }
}

// MARK: 中间的按钮
extension RootTabBarController{
    func presentModelVC() -> Void {
        // 当前选中的tabbarItem的index
        let currentSelectedIndex = selectedIndex
        
        let T = ThirdViewController()
        
        // dismiss之前先切换到当前页面
        T.dismissViewControllerBlock =
        { [weak self] in self?.selectedIndex = currentSelectedIndex }
        self.presentViewController(T, animated: true) { }
    }
    
    func addCenterButton(imageName: String, title: String) {
        let containerVC = UIViewController()
        containerVC.view.backgroundColor = UIColor.whiteColor()
        let buttonImage = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysOriginal)
        containerVC.tabBarItem.image = buttonImage
        containerVC.tabBarItem.tag = btnIndexCenter
        containerVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        let childNaviagation = UINavigationController(rootViewController: containerVC)
        addChildViewController(childNaviagation)
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        switch item.tag {
        case btnIndexCenter: presentModelVC()
        default: break
        }
    }
}