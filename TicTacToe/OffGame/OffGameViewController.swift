//
//  OffGameViewController.swift
//  TicTacToe
//
//  Created by 현은백 on 2022/01/20.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol OffGamePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {
    
    var uiviewController: UIViewController {
        return self
    }

    weak var listener: OffGamePresentableListener?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        buildStartButton()
    }

    // MARK: - Private

    private func buildStartButton() {
        let startButton = UIButton()
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        [
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 40),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 100)
        ].forEach{ $0.isActive = true }
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.black
    }
}
