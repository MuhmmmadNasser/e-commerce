//
//  ViewController.swift
//  e-commerce
//
//  Created by Mohamed on 12/08/2022.
//

import UIKit
import Alamofire
import NVActivityIndicatorView

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
        
        guard let email = emailTF.text , emailTF.text != "" else { return }
        guard let password = passwordTF.text , passwordTF.text != "" else { return }
        
        
        //present(signUpViewController, animated: true)
        //goToTabBar()
        login(email: email, password: password)
        //let userDeefault = UserDefaults.standard.string(forKey: "LoginToken")
        
//        if userDeefault != nil {
//            goToTabBar()
//        }
        
        
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
    
    func login(email: String, password: String) {
        
        guard let url = URL(string: URLSConfigFile.login) else { return }
        
        let parameters: [String: String] = ["email": email, "password": password]

        showLoader()
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: BaseResponse<LoginModel>.self) { response in
            
            defer {
                self.hideLoader()
            }
           
            switch response.result {

            case .success(let loginModel):
                print("email is",loginModel.data?.email)
                UserDefaults.standard.setValue(loginModel.data?.token, forKey: "LoginToken")
                
            case .failure(let error):
                //let jsonString = String(decoding: response.data ?? Data(), as: UTF8.self)
                print(error.localizedDescription)
            }
            
        }
    }
}

