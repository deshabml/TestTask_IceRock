//
//  AuthViewController.swift
//  TestTaskIceRock
//
//  Created by Лаборатория on 20.02.2023.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var authTextField: UITextField!

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        scrollView.isScrollEnabled = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    lazy var signInButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "ColorButton")
        configuration.title = "Sign In"
        configuration.baseForegroundColor = .white
        var signInButton = UIButton(configuration: configuration, primaryAction: nil)
        signInButton.configurationUpdateHandler = { button in
            switch button.state {
                case .selected, .highlighted, .disabled:
                    button.alpha = 0.8
                default:
                    button.alpha = 1
            }
        }
        signInButton.layer.cornerRadius = 8
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(buttonActionSignIn), for: .touchUpInside)
        return signInButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        textfildSetting()
        view.addSubview(scrollView)
        scrollView.addSubview(signInButton)
        installingСonstraints()
        subscriptKeyboardEvents()
        scrollView.keyboardDismissMode = .interactive
        autoHideTheKeyboard(view)
    }

}

extension AuthViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: authTextField.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            signInButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            signInButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 398),
            signInButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func textfildSetting() {
        authTextField.layer.borderWidth = 1
        authTextField.layer.cornerRadius = 8
        authTextField.layer.borderColor = CGColor(red: 33 / 255, green: 38 / 255, blue: 45 / 255, alpha: 1)
        authTextField.textColor = .white
        authTextField.tintColor = UIColor(cgColor: CGColor(red: 88 / 255, green: 166 / 255, blue: 255 / 255, alpha: 1))
        authTextField.leftViewMode = .always
        authTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: authTextField.frame.height))
        authTextField.keyboardType = .alphabet
        authTextField.delegate = self
        authTextField.addTarget(self, action: #selector(tapTextFild), for: .touchDown)
        authTextField.attributedPlaceholder = NSAttributedString(string: "Personal access token", attributes: [NSAttributedString.Key.foregroundColor: UIColor(cgColor: CGColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.5))])
        authTextField.autocorrectionType = .no

    }

    @objc func tapTextFild() {
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.authTextField.layer.borderColor = CGColor(red: 88 / 255, green: 166 / 255, blue: 255 / 255, alpha: 1)
        })
    }

    private func fadeAnimationTextFild() {
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.authTextField.layer.borderColor = CGColor(red: 33 / 255, green: 38 / 255, blue: 45 / 255, alpha: 1)
        })
    }

    @objc func buttonActionSignIn() {
        let rltvc = RepositoriesListTableViewController()
        print("opa opa")
        navigationController?.pushViewController(rltvc, animated: true)
    }

}

extension AuthViewController {

    private func subscriptKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyBoardWillShow(_ notification: NSNotification) {
        scrollView.contentOffset = CGPoint(x: 0, y: 211)
    }

    @objc func keyBoardWillHide(_ notification: NSNotification) {
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }

}

extension AuthViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        fadeAnimationTextFild()
        return false
    }

    func autoHideTheKeyboard(_ view: UIView) {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        view.addGestureRecognizer(recognizer)
    }

    @objc func touch() {
        self.view.endEditing(true)
        fadeAnimationTextFild()
    }

}
