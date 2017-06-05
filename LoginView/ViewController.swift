//
//  ViewController.swift
//  LoginView
//
//  Created by Veronika Hristozova on 6/2/17.
//  Copyright © 2017 Veronika Hristozova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginView.mainColor = .orange
        loginView.secondaryColor = .white
        loginView.delegate = self
    }
}

extension ViewController: LoginViewDelegate {
    func didTapButton(_ type: LoginViewButtonType) {
        switch type {
        case .facebook: print("Perform segue maybe?")
        case .forgotPassword: print("Open web view?")
        case .register: print("Perform segue?")
        case .signIn: print("Perform segue?")
        }
    }
}
