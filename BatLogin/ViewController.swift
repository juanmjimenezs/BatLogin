//
//  ViewController.swift
//  BatLogin
//
//  Created by Juan Manuel Jimenez Sanchez on 29/01/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var lblInstructions: UILabel!
    
    var viewAnimator: UIViewPropertyAnimator!
    private let unlockGesture = UIPanGestureRecognizer()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.unlockGesture.addTarget(self, action: #selector(handle(pan:)))
        self.view.addGestureRecognizer(unlockGesture)
        
        self.viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        self.viewAnimator.addAnimations {
            self.lblInstructions.layer.opacity = 0
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)//Que se haga más pequeño
        }
        //self.viewAnimator.startAnimation()
    }

    func handle(pan: UIPanGestureRecognizer) {
        let speed: CGFloat = 2.0
        
        switch pan.state {
        case .began:
            //Activamos la animación pero sin movimiento alguno
            self.viewAnimator.pauseAnimation()
        case .changed:
            let translation = pan.translation(in: pan.view).y / speed
            self.viewAnimator.fractionComplete = translation / 100
            if self.viewAnimator.fractionComplete >= 0.99 {
                buildAnimation()
            }
        default:
            break
        }
    }
    
    func buildAnimation() {
        let logoAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) { 
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 25.0, y: 25.0)
        }
        logoAnimator.startAnimation()
        logoAnimator.addCompletion { (UIViewAnimatingPosition) in
            self.beginApp()
        }
    }
    
    func beginApp() {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController")
        self.present(loginViewController!, animated: true, completion: nil)
    }
}

