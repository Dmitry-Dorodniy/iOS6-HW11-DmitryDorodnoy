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

    // MARK: - StackView
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.parentStackViewSpacing
        stackView.distribution = .equalSpacing

        return stackView
    }()

    private lazy var topAvatarStatusStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.spacing = Metric.topAvatarStatusStackViewSpacing
        stackView.alignment = .center

        return stackView
    }()

    private lazy var infoStatusStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading

        return stackView
    }()

    private lazy var iconStack: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading

        return stackView
    }()

    // MARK: - Elements
    private lazy var avatarView: UIImageView = {
        let avatar = UIImage(named: "avatar.jpg")
        var view = UIImageView(frame: CGRect(x: 0, y: 0, width: Metric.avatarHeight, height: Metric.avatarHeight))
        view.image = avatar

        view.clipsToBounds = true
        view.layer.cornerRadius = Metric.avatarHeight / 2

        return view
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()

        label.textColor = .white
        label.font = .systemFont(ofSize: Metric.nameLabelFontSize, weight: .medium)
        label.text = Texts.nameText

        return label
    }()

//    private lazy var isOnlineLabel: UILabel = {
//        let label = UILabel()
//
//        label.textColor = .lightGray
//        label.font = .systemFont(ofSize: 15, weight: .light)
//        label.text = "online"
//        let image = UIImage(systemName: "iphone")
//
//
//        return label
//    }()

    private lazy var nameButton = createButton(title: Texts.nameText, fontSize: 20,fontWeight: .semibold, titleColor: .white, backgroundColor: .clear)
    private lazy var setStatusButton = createButton(title: "Установить статус", fontSize: 17, fontWeight: .light, titleColor: #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1), backgroundColor: .clear)
    private lazy var isOnlineButton: UIButton = {
        let button = createButton(title: "online", fontSize: 15, fontWeight: .light, titleColor: .lightGray, backgroundColor: .clear)
        let image = UIImage(systemName: "iphone")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 14), forImageIn: .normal)
        button.configuration?.imagePadding = 4
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    private lazy var cameraButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "camera")?.withTintColor( #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1), renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
        return button
    }()
    private lazy var writeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "square.and.pencil")?.withTintColor( #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1), renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
        return button
    }()

    private lazy var photoButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "photo")?.withTintColor( #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1), renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
        return button
    }()

    private lazy var playButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.rectangle")?.withTintColor( #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1), renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
        return button
    }()

    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Редактировать", for: .normal)

        //        let image = UIImage(systemName: "iphone")
        //        button.setImage(image, for: .normal)
        //        button.configuration?.imagePadding = 12
        //      button.semanticContentAttribute = .forceRightToLeft


        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        button.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 1)

        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5


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
        view.backgroundColor = .black
    }

    private func setupHierarchy() {
        view.addSubview(parentStackView)
        parentStackView.addArrangedSubview(topAvatarStatusStackView)

        topAvatarStatusStackView.addArrangedSubview(avatarView)
        topAvatarStatusStackView.addArrangedSubview(infoStatusStackView)

        infoStatusStackView.heightAnchor.constraint(equalToConstant: Metric.avatarHeight).isActive = true
        //        infoStatusStackView.addArrangedSubview(nameLabel)
        infoStatusStackView.addArrangedSubview(nameButton)
        infoStatusStackView.addArrangedSubview(setStatusButton)
     infoStatusStackView.addArrangedSubview(isOnlineButton)
//        infoStatusStackView.addArrangedSubview(isOnlineLabel)

        parentStackView.addArrangedSubview(editButton)

        parentStackView.addArrangedSubview(iconStack)
        iconStack.addArrangedSubview(cameraButton)
        iconStack.addArrangedSubview(writeButton)
        iconStack.addArrangedSubview(photoButton)
        iconStack.addArrangedSubview(playButton)


        //        view.addSubview(avatarView)
        //        view.addSubview(nameLabel)

    }

    private func setupLayout() {

        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18).isActive = true
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true

        editButton.adjustsImageSizeForAccessibilityContentSizeCategory = false
        editButton.heightAnchor.constraint(equalToConstant: 33).isActive = true


        //        avatarView.translatesAutoresizingMaskIntoConstraints = false
        //        avatarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        //        avatarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        //        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        //        nameLabel.bottomAnchor.constraint(equalTo: avatarView.centerYAnchor, constant: -10).isActive = true
        //        nameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 20).isActive = true
    }
    private func createButton(title: String, fontSize: CGFloat, fontWeight: UIFont.Weight, titleColor: UIColor, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        button.backgroundColor = backgroundColor

        return button
    }
}


// MARK: - Constants
extension VkViewController {

    enum Metric {

        static let avatarHeight: CGFloat = 78
        static let nameLabelFontSize: CGFloat = 20

        static let parentStackViewSpacing: CGFloat = 15
        static let topAvatarStatusStackViewSpacing: CGFloat = 10
    }

    enum Texts {
        static let nameText = "Дмитрий Донской"
    }
}

