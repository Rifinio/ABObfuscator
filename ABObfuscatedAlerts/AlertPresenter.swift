//
//  AlertPresenter.swift
//  ABObfusctaedAlerts
//
//  Created by Adil Bougamza on 11/09/2018.
//  Copyright © 2018 Adil BOUGAMZA. All rights reserved.
//

import Foundation

import UIKit

class AlertPresenter {

    var alertController: UIAlertController!

    func showAlert(from controller: UIViewController, title: String?, message: String?, actions: [UIAlertAction]?, completion: (() -> Swift.Void)? = nil) {

        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let actions = actions {
            for action in actions {
                alertController.addAction(action)
            }
        }

        controller.present(alertController, animated: true, completion: completion)
    }
}
