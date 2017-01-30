//
//  LoginViewController.swift
//  BatLogin
//
//  Created by Juan Manuel Jimenez Sanchez on 29/01/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var imgBatLogin: UIImageView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblPass: UILabel!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnEnter: UIButton!
    
    var headerAnimator: UIViewPropertyAnimator!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgLogoBatman.transform = CGAffineTransform(translationX: 0.0, y: -120.0)
        self.imgBatLogin.transform = CGAffineTransform(translationX: 0.0, y: -170.0)
        self.lblUser.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        self.lblPass.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        self.txtPass.transform = CGAffineTransform(translationX: -350.0, y: 0.0)
        self.txtUser.transform = CGAffineTransform(translationX: -350.0, y: 0.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureViews()
        self.buildAnimations()
    }

    func configureViews() {
        self.txtUser.layer.cornerRadius = 8.0
        self.txtPass.layer.cornerRadius = 8.0
        self.btnEnter.layer.cornerRadius = 3.0
    }
    
    func buildAnimations() {
        self.headerAnimator = UIViewPropertyAnimator(duration: 0.6, curve: .easeInOut, animations: nil)
        self.headerAnimator.addAnimations {
            //Les decimos que vuelvan a su punto de origen
            self.imgLogoBatman.transform = CGAffineTransform.identity
            self.imgBatLogin.transform = CGAffineTransform.identity
            self.lblUser.transform = CGAffineTransform.identity
            self.lblPass.transform = CGAffineTransform.identity
            self.txtPass.transform = CGAffineTransform.identity
            self.txtUser.transform = CGAffineTransform.identity
        }
        self.headerAnimator.startAnimation()
    }
}
