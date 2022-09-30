//
//  SignUpViewController.swift
//  e-commerce
//
//  Created by Mohamed on 27/08/2022.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - OutLets
    @IBOutlet var nameView: UIView!
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var emailView: UIView!
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var passwordView: UIView!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var signUpBtnOutlet: UIButton!
    
    //MARK: - Vars
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        nameView.addLayer()
        emailView.addLayer()
        passwordView.addLayer()
        signUpBtnOutlet.addLayer()
    }
    
    //MARK: - Buttons Action
    @IBAction func didTappedHaveAccount(_ sender: UIButton) {
        goToSignIn()
    }
    
    //MARK: - Helper Function
    func goToSignIn() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        navigationController?.pushViewController(signInVC, animated: true)
    }

}
