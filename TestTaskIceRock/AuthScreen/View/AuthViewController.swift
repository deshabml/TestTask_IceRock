//
//  AuthViewController.swift
//  TestTaskIceRock
//
//  Created by Лаборатория on 20.02.2023.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var authTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        textfildSetting()
    }

}

extension AuthViewController {

    private func textfildSetting() {
        authTextField.layer.borderWidth = 1
        authTextField.layer.cornerRadius = 8
        authTextField.layer.borderColor = CGColor(red: 33 / 255, green: 38 / 255, blue: 45 / 255, alpha: 1)
        authTextField.textColor = .white
        authTextField.leftViewMode = .always
        authTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: authTextField.frame.height))
        authTextField.keyboardType = .URL
        authTextField.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
    }

    @objc func myTargetFunction() {
        authTextField.layer.borderColor = CGColor(red: 88 / 255, green: 166 / 255, blue: 255 / 255, alpha: 1)

    }


}
