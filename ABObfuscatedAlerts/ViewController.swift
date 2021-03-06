//
//  ViewController.swift
//  ABObfusctaedAlerts
//
//  Created by Adil Bougamza on 11/09/2018.
//  Copyright © 2018 Adil BOUGAMZA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var alertButton: UIButton!
    var obfuscator: XorObfuscator!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupContraints()

        let saltKey = "\(String(describing: AppDelegate.self))\(String(describing: NSMutableParagraphStyle.self))"
        obfuscator = XorObfuscator(salt: saltKey)
    }

    func setupView() {
        view.backgroundColor = UIColor(red: 184 / 255, green: 0, blue: 184 / 255, alpha: 1)

        alertButton = UIButton(type: .system)
        view.addSubview(alertButton)
        alertButton.setTitle("Show Alert!", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    func setupContraints() {
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        alertButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        alertButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }

    @objc func showAlert() {
        let action1 = UIAlertAction(title: "Default", style: .default) { _ in
            print("You've pressed default");
        }
        let action2 = UIAlertAction(title: "Destructive", style: .destructive) { _ in
            print("You've pressed the destructive");
        }

        let alertPresenter = AlertPresenter()
        let obfuscatedMessage = "Obfuscated message :\n\(obfuscator.obfuscate(string: "hello world!"))"
        alertPresenter.showAlert(from: self, title: "title", message: obfuscatedMessage, actions: [action1, action2], completion: nil)
    }
}

