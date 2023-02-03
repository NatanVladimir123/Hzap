//
//  HomeViewController.swift
//  LoginViewCode
//
//  Created by test on 02/02/23.
//

import UIKit

class HomeViewController: UIViewController {

    var homeScreen: HomeScreen?
    var data: [DataUser] = [DataUser(name: "Natã", nameImage: "n1"),
                            DataUser(name: "Pedro", nameImage: "n2"),
                            DataUser(name: "Geovana", nameImage: "n3")
    ]
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    

    
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
        //retornando o numero do array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
