//
//  ViewController.swift
//  SixGestureDemo
//
//  Created by 李 jia on 15/9/5.
//  Copyright (c) 2015年 l+. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var scrW = UIScreen.mainScreen().bounds.width
    var scrH = UIScreen.mainScreen().bounds.height
    var labTap: ModifyLabel4Present?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        tapTesting()
        swipeRightTesting()
        swipeLeftTesting()
        panTesting()
        longPressTesting()
        rotationTest()
        pinchTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tapTesting(){
        let tap = UITapGestureRecognizer(target: self, action: "tapShow:")
        self.view.addGestureRecognizer(tap)
    }
    func tapShow(sender: UITapGestureRecognizer){
        let animateLabTest=ModifyLabel4Present(position: sender.locationInView(self.view), textinfo: "TAP", backGroundColor: UIColor.yellowColor(), infoColor: UIColor.blackColor())
        animateLabTest.frame.size = CGSize(width: 80, height: 80)
        animateLabTest.center = sender.locationInView(self.view)
        animateLabTest.layer.cornerRadius = 40
        animateLabTest.clipsToBounds = true
        self.view.addSubview(animateLabTest)
        //上面创建图层，下面创建动画（动画只做淡出消失），图层出现不做动画处理
        UIView.beginAnimations("tapShowOut", context: nil)
        UIView.setAnimationDelay(0.2)
        UIView.setAnimationDuration(0.5)
        animateLabTest.alpha = 0.0
        UIView.commitAnimations()
    }
    var swipeRight: UISwipeGestureRecognizer?
    func swipeRightTesting(){
        swipeRight = UISwipeGestureRecognizer(target: self, action: "swipeRightShow:")
        swipeRight!.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight!)
        swipeRight?.numberOfTouchesRequired = 2
    }
    func swipeRightShow(sender: UISwipeGestureRecognizer){
        let swipeRightLab = ModifyLabel4Present(position: sender.locationInView(self.view), textinfo: "RIGHT➡️", backGroundColor: UIColor.magentaColor(), infoColor: UIColor.whiteColor())
        swipeRightLab.layer.cornerRadius = 25
        swipeRightLab.clipsToBounds = true
        self.view.addSubview(swipeRightLab)
        UIView.beginAnimations("swipeRightOut", context: nil)
        UIView.setAnimationDuration(1.5)
        swipeRightLab.frame.origin.x = scrW
        swipeRightLab.alpha = 0.0
        UIView.commitAnimations()
    }
    var swipeLeft: UISwipeGestureRecognizer?
    func swipeLeftTesting(){
        self.swipeLeft = UISwipeGestureRecognizer(target: self, action: "swipeLeftShow:")
        self.swipeLeft!.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(self.swipeLeft!)
        self.swipeLeft?.numberOfTouchesRequired = 2
    }
    func swipeLeftShow(sender: UISwipeGestureRecognizer){
        let swipeLeftLab = ModifyLabel4Present(position: sender.locationInView(self.view), textinfo: "⬅️LEFT", backGroundColor: UIColor.cyanColor(), infoColor: UIColor.whiteColor())
        swipeLeftLab.layer.cornerRadius = 25
        swipeLeftLab.clipsToBounds = true
        self.view.addSubview(swipeLeftLab)
        UIView.beginAnimations("swipeLeftOut", context: nil)
        UIView.setAnimationDuration(1.5)
        swipeLeftLab.frame.origin.x = 0-100
        swipeLeftLab.alpha = 0.0
        UIView.commitAnimations()
    }
    func panTesting(){
        let pan = UIPanGestureRecognizer(target: self, action: "panShow:")
        pan.requireGestureRecognizerToFail(swipeLeft!)
        pan.requireGestureRecognizerToFail(swipeRight!)
        self.view.addGestureRecognizer(pan)
    }
    func panShow(sender: UIPanGestureRecognizer){
        let panLab = ModifyLabel4Present(position: sender.locationInView(self.view), textinfo: "拖着走", backGroundColor: UIColor.redColor(), infoColor: UIColor.whiteColor())
        panLab.frame.size = CGSize(width: 90, height: 90)
        panLab.layer.cornerRadius = 45
        panLab.clipsToBounds = true
        self.view.addSubview(panLab)
        _ = sender.translationInView(self.view).x
        _ = sender.translationInView(self.view).y
        //panLab.transform = CGAffineTransformMakeTranslation(transX, transY)
        UIView.beginAnimations("panFinished", context: nil)
        UIView.setAnimationDuration(0.3)
        panLab.alpha = 0.0
        UIView.commitAnimations()
    }
    func longPressTesting(){
        let longPress = UILongPressGestureRecognizer(target: self, action: "longPressShow:")
        self.view.addGestureRecognizer(longPress)
    }
    func longPressShow(sender: UILongPressGestureRecognizer){
        let lpLab = ModifyLabel4Present(position: sender.locationInView(self.view), textinfo: "长按", backGroundColor: UIColor.purpleColor(), infoColor: UIColor.whiteColor())
        lpLab.frame.size = CGSizeMake(90, 90)
        lpLab.layer.cornerRadius = 45
        lpLab.layer.borderWidth = 5
        lpLab.layer.borderColor = UIColor.whiteColor().CGColor
        lpLab.clipsToBounds = true
        self.view.addSubview(lpLab)
        UIView.beginAnimations("longpressShow", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(1)
        UIView.setAnimationRepeatCount(3)
        lpLab.alpha = 0.0
        UIView.commitAnimations()
    }
    var rotation: UIRotationGestureRecognizer?
    func rotationTest(){
        self.rotation = UIRotationGestureRecognizer(target: self, action: "rotateShow:")
        self.view.addGestureRecognizer(rotation!)
    }
    func rotateShow(sender: UIRotationGestureRecognizer){
        let rotateLab = ModifyLabel4Present(position: sender.locationInView(self.view), textinfo: "Rotate", backGroundColor: UIColor.orangeColor(), infoColor: UIColor.whiteColor())
        self.view.addSubview(rotateLab)
        rotateLab.transform = CGAffineTransformMakeRotation(sender.rotation)
        UIView.beginAnimations("rotateShow", context: nil)
        UIView.setAnimationDuration(0.2)
        rotateLab.alpha = 0.0
        UIView.commitAnimations()
    }
    func pinchTest(){
        let pinch = UIPinchGestureRecognizer(target: self, action: "pinchShow:")
        //pinch.requireGestureRecognizerToFail(self.rotation!)
        self.view.addGestureRecognizer(pinch)
    }
    func pinchShow(sender: UIPinchGestureRecognizer){
        let pinchLab = ModifyLabel4Present(position: CGPoint(x: scrW/2-50, y: scrH/2-25), textinfo: "PINCH", backGroundColor: UIColor.whiteColor(), infoColor: UIColor.magentaColor())
        self.view.addSubview(pinchLab)
       UIView.animateWithDuration(0.5, delay: 0.01, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
        //self.view.layer.setAffineTransform(CGAffineTransformMakeScale(sender.scale, sender.scale))//动画时间有待研究
        self.view.transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
       } ,
        completion: { (finished:Bool) -> Void in
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.view.layer.setAffineTransform(CGAffineTransformIdentity)//很重要的回复原值的方法
            pinchLab.alpha = 0.0
        })
        })
    }
}//@end

