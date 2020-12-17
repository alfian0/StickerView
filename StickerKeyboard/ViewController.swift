//
//  ViewController.swift
//  StickerKeyboard
//
//  Created by Macintosh on 16/12/20.
//

import UIKit

class ViewController: UIViewController {
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type a message…"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        let sendButton = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        sendButton.setImage(UIImage(named: "ic_submission"), for: .normal)
        sendButton.tintColor = UIColor.lightGray
        textField.rightView = sendButton
        textField.rightViewMode = .always
        return textField
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        view.backgroundColor = .systemGroupedBackground
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("+", for: .normal)
        sendButton.tintColor = UIColor.lightGray
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.backgroundColor = .white
        view.addSubview(sendButton)
        sendButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        sendButton.layer.cornerRadius = 8
        sendButton.addTarget(self, action: #selector(sendTapped(_:)), for: .touchUpInside)
        view.addSubview(textField)
        textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        textField.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -8).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        return view
    }()
    
    private let stickerView: StickerView = {
        let view = StickerView()
        return view
    }()
        
    override var canBecomeFirstResponder: Bool { return true }
    
    override var inputAccessoryView: UIView? {
        get {
            return containerView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Chat"
    }

    @objc
    private func sendTapped(_ sender: UIButton) {
//        guard let text = textField.text else { return }
        if textField.inputView != nil {
            textField.inputView = nil
        } else {
            textField.inputView = stickerView
        }
        textField.reloadInputViews()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
