//
//  VkViewController.swift
//  iOS6-HW11-DmitryDorodnoy
//
//  Created by Dmitry Dorodniy on 18.05.2022.
//

import UIKit

class VkViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Elements
    private lazy var avatarView: UIImageView = {

        let avatar = UIImage(named: "avatar.jpg")
        var view = UIImageView()
        view.image = avatar

        view.clipsToBounds = true
        view.layer.cornerRadius = Metric.avatarHeight / 2

        return view
    }()

    private lazy var nameLabel: UILabel = {

        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: Metric.nameLabelFontSize, weight: .regular)
        label.text = Texts.nameText

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupHierarchy()
        setupLayout()

    }

    //    MARK: - Settings
    private func setupView() {
        view.backgroundColor = .black
        
    }

    private func setupHierarchy() {
        view.addSubview(avatarView)
        view.addSubview(nameLabel)

    }

    private func setupLayout() {
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        avatarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.bottomAnchor.constraint(equalTo: avatarView.centerYAnchor, constant: -10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 20).isActive = true

}
}

// MARK: - Constants
extension VkViewController {

    enum Metric {

        static let avatarHeight: CGFloat = 78
        static let nameLabelFontSize: CGFloat = 25
    }

    enum Texts {
        static let nameText = "Дмитрий Донской"
    }
}

