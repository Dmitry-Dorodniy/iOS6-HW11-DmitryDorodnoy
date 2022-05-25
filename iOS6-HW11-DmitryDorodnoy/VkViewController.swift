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
        stackView.distribution = .equalCentering
        stackView.alignment = .leading

        return stackView
    }()

    private lazy var menuStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = Metric.menuStackSpacing

        return stackView
    }()


    // MARK: - Elements
    private lazy var avatarView: UIImageView = {
        let avatar = UIImage(named: "avatar.jpg")
        var view = UIImageView(frame: CGRect(x: 0, y: 0,
                                             width: Metric.avatarHeight,
                                             height: Metric.avatarHeight))
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

    private lazy var nameButton = createStringButton(title: Texts.nameText,
                                                     fontSize: 20,
                                                     fontWeight: .semibold,
                                                     titleColor: .white,
                                                     backgroundColor: .clear)

    private lazy var setStatusButton = createStringButton(title: "Установить статус",
                                                          fontSize: 17,
                                                          fontWeight: .light,
                                                          titleColor: #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1),
                                                          backgroundColor: .clear)

    private lazy var isOnlineButton: UIButton = {
        let button = createStringButton(title: "online",
                                        fontSize: 15,
                                        fontWeight: .light,
                                        titleColor: .lightGray,
                                        backgroundColor: .clear)
        let image = UIImage(systemName: "iphone")?.withTintColor(.lightGray, renderingMode: .alwaysTemplate)
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 14), forImageIn: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
//    private lazy var isOnlineButton: UIButton = {
//       let button =  createImageandStringButton(systemImage: "iphone",
//                                                tintColor: .lightGray,
//                                                               padding: 3,
//                                                imagePlacement: .trailing,
//                                                               title: "online",
//                                                               fontSize: Metric.icomMenuFontSize,
//                                                               fontWeight: .light,
//                                                titleColor: .lightGray ,
//                                                               backgroundColor: .clear)
//        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 13), forImageIn: .normal)
//        button.configuration?.titleAlignment = .leading
//
//        return button
//    }()

    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Редактировать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        button.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 1)

        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5

        return button

    }()

    // MARK: - Icon Buttons
//
//    private lazy var cameraButton: UIButton = {
//        let button = UIButton()
//        let image = UIImage(systemName: "camera")?.withTintColor( #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1), renderingMode: .alwaysOriginal)
//        button.setImage(image, for: .normal)
//        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
//        return button
//    }()
    private lazy var cameraButton: UIButton = {

        let button = createImageandStringButton(systemImage: "camera",
                                                             tintColor: #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                             padding: 10,
                                                             imagePlacement: .top,
                                                               imageSize: 15,
                                                             title: "История",
                                                               fontSize: Metric.icomMenuFontSize,
                                                               fontWeight: .light,
                                                             titleColor:  #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                             backgroundColor: .clear)



        return button
    }()


    private lazy var writeButton = createImageandStringButton(systemImage: "person.text.rectangle",
                                                               tintColor: #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                               padding: 10,
                                                               imagePlacement: .top,
                                                              imageSize: 15,
                                                               title: "Запись",
                                                               fontSize: Metric.icomMenuFontSize,
                                                               fontWeight: .light,
                                                               titleColor:  #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                               backgroundColor: .clear)

//    private lazy var photoButton: UIButton = {
//        let button = UIButton()
//        let image = UIImage(systemName: "photo")?.withTintColor( #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1), renderingMode: .alwaysOriginal)
//        button.setImage(image, for: .normal)
//        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
//        return button
//    }()

    private lazy var photoButton = createImageandStringButton(systemImage: "photo",
                                                              tintColor: #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                              padding: 10,
                                                              imagePlacement: .top,
                                                              imageSize: 15,
                                                              title: "Фото",
                                                              fontSize: Metric.icomMenuFontSize,
                                                              fontWeight: .light,
                                                              titleColor:  #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                              backgroundColor: .clear)

//    private lazy var playButton: UIButton = {
//        let button = UIButton()
//        let image = UIImage(systemName: "play.rectangle")?.withTintColor( #colorLiteral(red: 0.4233195782, green: 0.6811253428, blue: 0.9225201011, alpha: 1), renderingMode: .alwaysOriginal)
//        button.setImage(image, for: .normal)
//        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
//        return button
//    }()

    private lazy var playButton = createImageandStringButton(systemImage: "play.rectangle",
                                                              tintColor: #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                              padding: 10,
                                                              imagePlacement: .top,
                                                             imageSize: 15,
                                                              title: "Клип",
                                                              fontSize: Metric.icomMenuFontSize,
                                                              fontWeight: .light,
                                                              titleColor:  #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                              backgroundColor: .clear)


    private lazy var cityButton = createImageandStringButton(systemImage: "house",
                                                             tintColor: .gray,
                                                             padding: 11,
                                                             imagePlacement: .leading,
                                                             imageSize: 15,
                                                             title: "Город: Ростов",
                                                             fontSize: 20,
                                                             fontWeight: .light,
                                                             titleColor: .gray,
                                                             backgroundColor: .clear)

    private lazy var subscribersButton = createImageandStringButton(systemImage: "dot.radiowaves.up.forward",
                                                             tintColor: .gray,
                                                             padding: 15,
                                                             imagePlacement: .leading,
                                                                    imageSize: 18,
                                                             title: "69 подписчиков",
                                                             fontSize: 20,
                                                             fontWeight: .light,
                                                             titleColor: .gray,
                                                             backgroundColor: .clear)

    private lazy var workPlaceButton = createImageandStringButton(systemImage: "creditcard",
                                                                  tintColor: #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                                    padding: 15,
                                                                    imagePlacement: .leading,
                                                                  imageSize: 13,
                                                                    title: "Указать место работы",
                                                                    fontSize: 20,
                                                                    fontWeight: .light,
                                                                    titleColor:  #colorLiteral(red: 0.4235439897, green: 0.6808486581, blue: 0.9224407673, alpha: 1),
                                                                    backgroundColor: .clear)

    private lazy var getGiftButton = createImageandStringButton(systemImage: "snowflake",
                                                                  tintColor: #colorLiteral(red: 0.4456846118, green: 0.3789182901, blue: 0.7340885401, alpha: 1),
                                                                  padding: 16,
                                                                  imagePlacement: .leading,
                                                                imageSize: 17,
                                                                  title: "Получить подарок",
                                                                  fontSize: 20,
                                                                  fontWeight: .light,
                                                                titleColor: #colorLiteral(red: 0.4456846118, green: 0.3789182901, blue: 0.7340885401, alpha: 1),
                                                                  backgroundColor: .clear)

    private lazy var infoButton = createImageandStringButton(systemImage: "info.circle",
                                                                tintColor: .white,
                                                                padding: 16,
                                                                imagePlacement: .leading,
                                                             imageSize: 15,
                                                                title: "Подробная информация",
                                                                fontSize: 20,
                                                                fontWeight: .light,
                                                                titleColor:.white,
                                                                backgroundColor: .clear)

    // MARK: - Activity
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

        parentStackView.addArrangedSubview(menuStackView)
        menuStackView.addArrangedSubview(cityButton)
        menuStackView.addArrangedSubview(subscribersButton)
        menuStackView.addArrangedSubview(workPlaceButton)
        menuStackView.addArrangedSubview(getGiftButton)
        menuStackView.addArrangedSubview(infoButton)


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


    }
    private func createStringButton(title: String,
                                    fontSize: CGFloat,
                                    fontWeight: UIFont.Weight,
                                    titleColor: UIColor,
                                    backgroundColor: UIColor) -> UIButton {

        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        button.backgroundColor = backgroundColor

        return button
    }

    private func createImageandStringButton (systemImage: String,
                                             tintColor: UIColor,
                                             padding: CGFloat,
                                             imagePlacement: NSDirectionalRectEdge,
                                             imageSize: CGFloat,
                                             title: String,
                                             fontSize: CGFloat,
                                             fontWeight: UIFont.Weight,
                                             titleColor: UIColor,
                                             backgroundColor: UIColor) -> UIButton {

        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.imagePadding = padding
        config.imagePlacement = imagePlacement

        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
            return outgoing
        }

        button.configuration = config

        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)

//        button.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        button.backgroundColor = backgroundColor

    let font = UIFont.systemFont(ofSize: imageSize) // <- make it larger, smaller, whatever you want.
       let imageConfig = UIImage.SymbolConfiguration(font: font)

        let image = UIImage(systemName: systemImage, withConfiguration: imageConfig)?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)

        return button
    }


}


// MARK: - Constants
extension VkViewController {

    enum Metric {

        static let avatarHeight: CGFloat = 78
        static let nameLabelFontSize: CGFloat = 20
        static let icomMenuFontSize: CGFloat = 15
        static let parentStackViewSpacing: CGFloat = 20
        static let topAvatarStatusStackViewSpacing: CGFloat = 10
        static let menuStackSpacing: CGFloat = 12
    }

    enum Texts {
        static let nameText = "Дмитрий Донской"
    }
}

