//
//  AppDelegate.swift
//  TwitterLaunchAnimaProject
//
//  Created by zhifu360 on 2019/5/16.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: ScreenSize)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        
        //获取根视图view
        guard let view = window?.rootViewController?.view else { fatalError() }
        
        //创建logo图片，添加一个mask
        let logoLayer = CAShapeLayer()
        logoLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoLayer.position = view.center
        logoLayer.contents = UIImage(named: "TwitterLogo_white")?.cgImage
        view.layer.mask = logoLayer
        
        //覆盖一层白色view，修改windo背景色
        let shelterView = UIView(frame: view.frame)
        shelterView.backgroundColor = .white
        view.addSubview(shelterView)
        
        //修改window背景色
        window!.backgroundColor = UIColor(red: 29/255.0, green: 161/255.0, blue: 242/255.0, alpha: 1)
        
        //使用CAKeyframeAnimation实现logo的缩放
        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        logoAnimation.beginTime = CACurrentMediaTime()+1
        logoAnimation.duration = 1
        logoAnimation.keyTimes = [0,0.4,1]
        logoAnimation.values = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)), NSValue(cgRect: CGRect(x: 0, y: 0, width: 85, height: 85)), NSValue(cgRect: CGRect(x: 0, y: 0, width: 4500, height: 4500))]
        logoAnimation.isRemovedOnCompletion = false
        logoAnimation.fillMode = CAMediaTimingFillMode.forwards
        logoLayer.add(logoAnimation, forKey: "zoomAnimation")
        
        //设置logo透明渐变
        UIView.animate(withDuration: 0.3, delay: 1.4, options: .curveLinear, animations: {
            shelterView.alpha = 0
        }) { (finish) in
            shelterView.removeFromSuperview()
            view.layer.mask = nil
        }
        
        //初始界面抖动动画
        let mainViewAnimation = CAKeyframeAnimation(keyPath: "transform")
        mainViewAnimation.beginTime = CACurrentMediaTime()+1.1
        mainViewAnimation.duration = 1
        mainViewAnimation.keyTimes = [0,0.5,1]
        mainViewAnimation.values = [NSValue(caTransform3D: CATransform3DIdentity), NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity, 1.1, 1.1, 1)), NSValue(caTransform3D: CATransform3DIdentity)]
        view.layer.add(mainViewAnimation, forKey: "transformAnimation")
        view.layer.transform = CATransform3DIdentity
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

