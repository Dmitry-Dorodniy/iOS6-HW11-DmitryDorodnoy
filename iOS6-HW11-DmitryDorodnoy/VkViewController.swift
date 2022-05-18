//
//  VkViewController.swift
//  iOS6-HW11-DmitryDorodnoy
//
//  Created by Dmitry Dorodniy on 18.05.2022.
//

import UIKit

class VkViewController: UIViewController {

    // MARK: - Elements
    private lazy var labelCounter: UILabel = {
        var label = UILabel()
        label.textColor = .white
        // label.font = .systemFont(ofSize: 70)
        label.font = .monospacedDigitSystemFont(ofSize: 100, weight: .thin)
        label.text = "00:00,00"
        return label
    }()

    private lazy var buttonCircleLeft: UIButton = {

        var button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitle("Круг", for: .normal)
        //        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        button.setTitleColor(.lightGray, for: .normal)

        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor

        button.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        button.layer.cornerRadius = 50
        button.clipsToBounds = true

        return button
    }()

    private lazy var subButtonCircleLeft: UIView = {

        var button = UIView()
        button.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        button.layer.cornerRadius = 54
        button.clipsToBounds = true

        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupHierarchy()
        setupLayout()

    }

    //    MARK: - Settings
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

    private func setupHierarchy() {
        view.addSubview(labelCounter)
        view.addSubview(subButtonCircleLeft)

    }

    private func setupLayout() {
        labelCounter.translatesAutoresizingMaskIntoConstraints = false
        labelCounter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelCounter.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
    }
}

//MARK: - Constants
extension ViewController {

}
