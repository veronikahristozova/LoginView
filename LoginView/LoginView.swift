//
//  LoginView.swift
//  LoginView
//
//  Created by Veronika Hristozova on 6/2/17.
//  Copyright © 2017 Veronika Hristozova. All rights reserved.
//

import UIKit

enum LoginViewButtonType {
    case register
    case signIn
    case forgotPassword
    case facebook
}

protocol LoginViewDelegate: class {
    func didTapButton(_ type: LoginViewButtonType)
}

class LoginView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var userEmailImageView: UIImageView!
    @IBOutlet weak var keypassImageView: UIImageView!
    @IBOutlet weak var reKeypassImageView: UIImageView!
 
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    @IBOutlet weak var initialSingupWithEmailButton: UIButton!
    @IBOutlet weak var initialSinginButton: UIButton!
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var facebookLogoImageView: UIImageView!
    @IBOutlet weak var loginWithFacebookLabel: UILabel!
    
    @IBOutlet weak var initalSinginUpStackView: UIStackView!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var singInInsteadButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var rePasswordStackView: UIStackView!
    
    //MARK: - Variables
    public var mainColor: UIColor = .orange { didSet { setMainColor() } }
    public var secondaryColor: UIColor = .white { didSet { setSecondaryColor() } }
    weak var delegate: LoginViewDelegate?
    
    //MARK: - IBActions
    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        delegate?.didTapButton(.register)
    }
    @IBAction func didTapSignInButton(_ sender: UIButton) {
        delegate?.didTapButton(.signIn)
    }
    @IBAction func didTapForgotPasswordButton(_ sender: UIButton) {
        delegate?.didTapButton(.forgotPassword)
    }
    // Facebook View tapped
    @objc fileprivate func didTapFacebookView(_ sender: UITapGestureRecognizer) {
        delegate?.didTapButton(.facebook)
    }
    
    @IBAction func didTapSignInInsteadButton(_ sender: UIButton) {
        hideViews(views: [rePasswordStackView, registerButton, singInInsteadButton], hidden: true)
        hideViews(views: [signInButton, forgotPasswordButton], hidden: false)
    }

    @IBAction func didTapSignUpWithEmailButton(_ sender: UIButton) {
        initalSinginUpStackView.isHidden = true
        hideViews(views: [emailStackView, passwordStackView, rePasswordStackView, registerButton, singInInsteadButton], hidden: false)
        
    }
    @IBAction func didTapInitialSignInButton(_ sender: UIButton) {
        initalSinginUpStackView.isHidden = true
        hideViews(views: [emailStackView, passwordStackView, signInButton, forgotPasswordButton], hidden: false)
    }
    
    //MARK: - Setup UI
    private func setMainColor() {
        setTintColor(views: [userEmailImageView, keypassImageView, reKeypassImageView], color: mainColor)
        setTitleColor(views: [initialSinginButton, initialSingupWithEmailButton, forgotPasswordButton, singInInsteadButton], color: mainColor)
        setBackgroundColor(views: [facebookView, facebookLogoImageView, signInButton, registerButton], color: mainColor)
        facebookLogoImageView.tintColor = mainColor.withAlphaComponent(0.5)
    }
    
    private func setSecondaryColor() {
        setBackgroundColor(views: [initialSinginButton, initialSingupWithEmailButton, facebookLogoImageView], color: secondaryColor)
        loginWithFacebookLabel.textColor = secondaryColor
        setTitleColor(views: [signInButton, registerButton], color: secondaryColor)
        
    }
    
    //Helper UI functions
    private func setBackgroundColor(views: [UIView], color: UIColor) {
        views.forEach { view in
            view.backgroundColor = color
        }
    }
    
    private func setTintColor(views: [UIView], color: UIColor) {
        views.forEach { view in
            view.tintColor = color
        }
    }
    private func setTitleColor(views: [UIButton], color: UIColor) {
        views.forEach { view in
            view.setTitleColor(color, for: .normal)
        }
    }
    
    private func hideViews(views: [UIView], hidden: Bool) {
        //Animations
        views.forEach { view in
            if hidden {
                UIView.animate(withDuration: 0.8, animations: {
                    view.alpha = 0
                }) { (finished) in
                    view.isHidden = hidden
                }
            } else {
                view.alpha = 0
                view.isHidden = hidden
                UIView.animate(withDuration: 0.8) {
                    view.alpha = 1
                }
            }
        }
    }

    /// Round up the corners of views
    ///
    /// - Parameters:
    ///   - views: to round the corners of
    ///   - cornerRadius: to be used
    fileprivate func addCornerRadiusToView(_ views: [UIView], _ cornerRadius: CGFloat) {
        for currentView in views {
            currentView.layer.cornerRadius = cornerRadius
            currentView.layer.masksToBounds = true
        }
    }
    /// Add bottom border to a text field
    ///
    /// - Parameters:
    ///   - textField: to add bottom border to
    ///   - borderWidth: the width of the border in CGFloat
    ///   - borderColor: of the border
    fileprivate func addBottomBorderToTextField(_ textField: UITextField,_  borderWidth: CGFloat,_  borderColor: CGColor) {
        let border = CALayer()
        border.borderColor = borderColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - borderWidth, width:  textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = borderWidth
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    
    
    //MARK: - Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTapFacebookView(_:)))
        facebookView.addGestureRecognizer(tap)
        facebookView.isUserInteractionEnabled = true
       
        // Buttons UI
        addCornerRadiusToView([signInButton, facebookView, registerButton,facebookLogoImageView], CGFloat(4))
        // Text fields UI, etc
        addBottomBorderToTextField(emailTextField, 0.5, UIColor.lightGray.withAlphaComponent(0.6).cgColor)
        addBottomBorderToTextField(passwordTextField, 0.5, UIColor.lightGray.withAlphaComponent(0.6).cgColor)
        addBottomBorderToTextField(rePasswordTextField, 0.5, UIColor.lightGray.withAlphaComponent(0.6).cgColor)
        
        hideViews(views: [emailStackView, passwordStackView, rePasswordStackView, registerButton, forgotPasswordButton, singInInsteadButton, signInButton], hidden: true)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        rePasswordTextField.delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
}
extension UIView {
    func loadFromNib(_ nibName: String = String(describing: type(of: self))) {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
}
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
