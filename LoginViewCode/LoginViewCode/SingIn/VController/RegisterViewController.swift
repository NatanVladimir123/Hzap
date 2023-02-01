//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by test on 26/01/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    var auth:Auth?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
    }
    

}

// tentar coloca todas as verificaçoes aqui
extension RegisterViewController: UITextFieldDelegate{
    //quando o teclado abaixar -> faz a verificação
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterViewController: RegisterScrrenProtocol{
    func actionBackButton() {
        print("Botão de voltar")
        self.navigationController?.popViewController(animated: true) //indo pra login <3
    }
    
    func actionRegisterButton() {
        //criando usuario fireBase *_*
        guard let register = self.registerScreen else {return}
    
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result, error in
            
            if error != nil{
                print("Erro no cadastro")
            }else{
                print("Cadastro realizado com sucesso!")
            }
            
        })
        
    }
    
}
