//
//  PlanetAnimationVC.swift
//  AnimationIosAcademy
//
//  Created by Harshvirsinh Parmar on 08/12/21.
//

import UIKit
import Lottie
import AVFoundation
class PlanetAnimationVC: UIViewController {
    var player: AVAudioPlayer!
    var animation =  AnimationView()
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    @IBOutlet var slider: UISlider!
    @IBOutlet var earthImg: UIImageView!
    @IBOutlet var lottieView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(soundName: "marsSound")
        configureEndAnimation()
        letanimate()
    }
    
    func letanimate(){
        earthImg.alpha = 0.0
        earthImg.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        animation.animation = Animation.named("planets")
        animation.frame = lottieView.bounds
        animation.contentMode = .scaleAspectFill
        animation.loopMode = .loop
        animation.play()
        lottieView.addSubview(animation)
}
    func configureEndAnimation(){
        animator.addAnimations {
            self.earthImg.alpha = 1.0
            self.earthImg.transform = CGAffineTransform(scaleX: 3, y: 3)
        }
        animator.addAnimations({
            self.earthImg.frame.origin.y -= 400
        }, delayFactor: 0.5)
    }
    
    @IBAction func slideAction(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        player.numberOfLoops = -1
                
    }
}
