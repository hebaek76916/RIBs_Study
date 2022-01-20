//
//  LoggedOutViewController.swift
//  TicTacToe
//
//  Created by 현은백 on 2022/01/20.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func login(withPlayer1Name player1Name: String?, player2Name: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {
    
    weak var listener: LoggedOutPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let playerFields = buildPlayerFields()
        buildLoginButton(withPlayer1Field: playerFields.player1Field, player2Field: playerFields.player2Field)
    }
    
    // MARK: - Private
    
    private var player1Field: UITextField?
    private var player2Field: UITextField?
    
    private func buildPlayerFields() -> (player1Field: UITextField, player2Field: UITextField) {
        let player1Field = UITextField()
        self.player1Field = player1Field
        player1Field.borderStyle = UITextBorderStyle.line
        view.addSubview(player1Field)
        player1Field.placeholder = "Player 1 name"
        
        player1Field.translatesAutoresizingMaskIntoConstraints = false
        [
            player1Field.topAnchor.constraint(equalTo: view.topAnchor,
                                              constant: 100),
            player1Field.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                  constant: 40),
            player1Field.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -40),
            player1Field.heightAnchor.constraint(equalToConstant: 40)
        ].forEach{ $0.isActive = true }
        
        let player2Field = UITextField()
        self.player2Field = player2Field
        player2Field.borderStyle = UITextBorderStyle.line
        view.addSubview(player2Field)
        player2Field.placeholder = "Player 2 name"
        player2Field.translatesAutoresizingMaskIntoConstraints = false
        [
            player2Field.topAnchor.constraint(equalTo: player1Field.bottomAnchor,
                                              constant: 20),
            player2Field.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                  constant: 40),
            player2Field.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -40),
            player2Field.heightAnchor.constraint(equalTo: player1Field.heightAnchor)
        ].forEach{ $0.isActive = true }
        
        return (player1Field, player2Field)
    }
    
    private func buildLoginButton(withPlayer1Field player1Field: UITextField, player2Field: UITextField) {
        let loginButton = UIButton()
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        [
            loginButton.topAnchor.constraint(equalTo: player2Field.bottomAnchor,
                                             constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: player1Field.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: player1Field.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: player1Field.heightAnchor)
        ].forEach{ $0.isActive = true }
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor.black
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc private func didTapLoginButton() {
        listener?.login(withPlayer1Name: player1Field?.text, player2Name: player2Field?.text)
    }
}
