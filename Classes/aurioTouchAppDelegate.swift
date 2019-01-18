//
//  aurioTouchAppDelegate.swift
//  aurioTouch
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/2/1.
//
//
/*

 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 App delegate

 */

import UIKit

@UIApplicationMain
@objc(aurioTouchAppDelegate)
class aurioTouchAppDelegate: NSObject, UIApplicationDelegate {
    @IBOutlet var window: UIWindow?
    @IBOutlet var view: EAGLView!
    
    //MARK:-
    
    //麦克风
    func checkMicroPermission() -> Bool{
        let mediaType = AVMediaType.audio
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: mediaType)
        switch authorizationStatus {
        case .notDetermined:  //用户尚未做出选择
            return false
        case .authorized:  //已授权
            return true
        case .denied:  //用户拒绝
            return false
        case .restricted:  //家长控制
            return false
        }
    }
    
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        checkMicroPermission();
        let screenBounds = UIScreen.main.bounds
        window = UIWindow(frame: screenBounds)
        
        let myVC = UIViewController(nibName: nil, bundle: nil)
        myVC.view = view
        
        self.window?.rootViewController = myVC
        
        // Turn off the idle timer, since this app doesn't rely on constant touch input
        application.isIdleTimerDisabled = true
        
        window?.makeKeyAndVisible()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //start animation now that we're in the foreground
        view.applicationResignedActive = false
        view.startAnimation()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        //stop animation before going into background
        view.applicationResignedActive = true
        view.stopAnimation()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    
}
