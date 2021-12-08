//
//  ViewController.swift
//  AnimationIosAcademy
//
//  Created by Harshvirsinh Parmar on 08/12/21.
//

import UIKit
import TheAnimation
class ViewController: UIViewController {
    var layer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        layer.backgroundColor = UIColor.brown.cgColor
        layer.frame = CGRect(x: 130, y: 350, width: 120, height: 120)
        view.layer.addSublayer(layer)
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            self.animatecorner()
            self.animateopacity()
            self.animateMovement()
            self.animaterotate()
            
        }
        
        // Do any additional setup after loading the view.
    }
    func animateMovement(){
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.width/2), y: layer.frame.origin.y + (layer.frame.height/2))
        animation.toValue = CGPoint(x: 200, y: 600)
        animation.duration = 2
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        // layer.add(animation, forKey: nil)
    }
    func animateopacity(){
        let animation = BasicAnimation(keyPath: .opacity)
        animation.fromValue = 1
        animation.toValue = 0.4
        animation.duration = 2
        layer.backgroundColor = UIColor.red.cgColor

        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        //layer.add(animation, forKey: nil)
    }
    func animatecorner(){
        let animation = BasicAnimation(keyPath: .cornerRadius)
       animation.fromValue = 0
        animation.toValue = 60
        animation.duration = 2
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        // layer.add(animation, forKey: nil)
       
    }
    func animaterotate(){
        let animation = BasicAnimation(keyPath: .transformRotationZ)
       animation.fromValue = 0
        animation.toValue = 7
        animation.duration = 2
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        // layer.add(animation, forKey: nil)
    }


}

