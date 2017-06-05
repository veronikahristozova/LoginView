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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: LoginViewDelegate {
    func didTapButton(_ type: LoginViewButtonType) {
        switch type {
        case .facebook: print("")
        case .forgotPassword: print("")
        case .register: print("")
        case  .signIn: print("")
        }
    }
}
