//
//  ViewController.swift
//  e-commerce
//
//  Created by Mohamed on 12/08/2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet var emailView: UIView!
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var passwordView: UIView!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginBtnOutlet: UIButton!
    
    //MARK: - Vars
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.addLayer()
        passwordView.addLayer()
        loginBtnOutlet.addLayer()
        //passwordTF.text = "LOGIN".localized
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    //MARK: - Buttons Action
    @IBAction func loginPressedBtn(_ sender: UIButton) {
        
        
        //present(signUpViewController, animated: true)
        goToTabBar()
    }
    
    @IBAction func didTappedSignUp(_ sender: UIButton) {
        goToSignUp()
    }
    
    @IBAction func didTappedForgetPassword(_ sender: UIButton) {
        goToForgetPassword()
    }
    
    //MARK: - Helper Functions
    
    func goToSignUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    func goToTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        let nvg = UINavigationController(rootViewController: tabBar)
        nvg.modalPresentationStyle = .fullScreen
        present(nvg, animated: true)
    }
    
    func goToForgetPassword() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let forgetPasswordVC = storyboard.instantiateViewController(withIdentifier: "ForgetPasswordViewController")
        navigationController?.pushViewController(forgetPasswordVC, animated: true)
    }
}

