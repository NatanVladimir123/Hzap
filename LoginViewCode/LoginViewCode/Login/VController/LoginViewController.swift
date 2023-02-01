//
//  ViewController.swift
//  LoginViewCode
//
//  Created by test on 23/01/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var auth:Auth?
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false) // escondendo animação da navigation controller
    }
    
}

extension LoginViewController:LoginScreenProtocol{
    func actionLoginButton() {
        guard let login = self.loginScreen else {return}
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
            
            if error != nil{
                print("Dados incorretos")
            }else{
                if usuario == nil{
                    print("Problema inesperado, tente mais tarde!")
                }else{
                    print("Login efetuado - dados batento ***")
                }
                    
            }
        })
        
    }
    
    func actionRegisterButton() {
        print("Deu certo registro")
        let vcontrol: RegisterViewController = RegisterViewController()
       self.navigationController?.pushViewController(vcontrol, animated: true) // para chamar outra tela
    }
    
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        self.loginScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //para teclado descer 
    }
}
