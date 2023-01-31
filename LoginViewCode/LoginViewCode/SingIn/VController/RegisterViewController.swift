//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by test on 26/01/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
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
        print("Botão de registro")
    }
    
}
