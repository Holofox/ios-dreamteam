//
//  EditDetailViewController.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class EditDetailViewController: UIViewController {
    
    var presenter: EditDetailPresentation!
    
    var entry: RealmEntryItem? {
        didSet {
            setupAttachmentImage(imageUrl: entry?.picturePath)
            
            titleTextField.text = entry?.title
            descriptionTextView.text = entry?.desc
            urlTextField.text = entry?.picturePath
        }
    }
    
    private func setupAttachmentImage(imageUrl: String?) {
        if let imageUrl = imageUrl {
            attachmentImageView.loadImageUsingUrlString(urlString: imageUrl)
        }
    }
    
    let attachmentImageView: CustomUIImageView = {
        let imageView = CustomUIImageView()
            imageView.backgroundColor = Color.backgroundColor
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let urlLabel: UILabel = {
        let label = UILabel()
            label.text = Constants.urlLabel
            label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let urlTextField: UITextField = {
        let textField = UITextField()
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.backgroundColor = .white
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.placeholder = Constants.urlPlaceholder
        
        return textField
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
            label.text = Constants.titleLabel
            label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
            textField.placeholder = Constants.titlePlaceholder
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.backgroundColor = .white
        
        return textField
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
            label.text = Constants.desriptionLabel
            label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
            textView.font = UIFont.preferredFont(forTextStyle: .subheadline)
            textView.layer.borderColor = Color.borderColor
            textView.layer.borderWidth = 0.5
            textView.layer.cornerRadius = 5
            textView.isScrollEnabled = false
            textView.dataDetectorTypes = .all
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupNavBarButtons()
        setupLayout()
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationItem.title = entry?.title
    }
    
    fileprivate func setupNavBarButtons() {
        let saveButton = UIBarButtonItem(title: Constants.save, style: .plain, target: self, action: #selector(handleSave))
            saveButton.isEnabled = false
        
        navigationItem.rightBarButtonItems = [saveButton]
    }
    
    fileprivate func setupLayout() {
        
        let views = [attachmentImageView, urlLabel, urlTextField, titleLabel, titleTextField, descriptionLabel, descriptionTextView]
            views.forEach (self.view.addSubview(_:))
        
        self.view.backgroundColor = Color.backgroundColor
        
        // Attachment section
        attachmentImageView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: 0, height: 250))
        
        // Url section
        urlLabel.anchor(top: attachmentImageView.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        urlTextField.anchor(top: urlLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        urlTextField.addTarget(self, action: #selector(urlTextFieldEditingDidEnd), for: .editingDidEnd)
        
        // Title section
        titleLabel.anchor(top: urlTextField.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        titleTextField.anchor(top: titleLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        titleTextField.addTarget(self, action: #selector(titleTextFieldEditingDidEnd), for: .editingChanged)
        
        // Description section
        descriptionLabel.anchor(top: titleTextField.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        descriptionTextView.anchor(top: descriptionLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        descriptionTextView.delegate = self
        
        [titleTextField, urlTextField].forEach({ $0.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged) })
    }

    @objc fileprivate func handleSave() {
        let item = EntryItem(id: (entry?.id)!, title: titleTextField.text!, desc: descriptionTextView.text, mark: (entry?.mark)!, picturePath: urlTextField.text!)
        
        self.navigationController?.popViewController(animated: true)
        self.presenter.onUpdateEntry(item: item)
    }
    
    @objc fileprivate func urlTextFieldEditingDidEnd(_ textField: UITextField) {
        do {
            let pictureUrl = try urlTextField.validatedText(validationType: ValidatorType.url)
            setupAttachmentImage(imageUrl: pictureUrl)
        } catch {
            print("\(#function): \(error)")
        }
    }

    @objc fileprivate func titleTextFieldEditingDidEnd(_ textField: UITextField) {
        do {
            let title = try titleTextField.validatedText(validationType: ValidatorType.requiredField(field: Constants.titleLabel))
            self.navigationItem.title = title
        } catch {
            self.navigationItem.title = entry?.title
        }
    }
    
    @objc fileprivate func textFieldEditingChanged(_ textField: UITextField) {
        validateFields()
    }
    
    func validateFields() {
        do {
            try _ = titleTextField.validatedText(validationType: ValidatorType.requiredField(field: Constants.titleLabel))
            try _ = descriptionTextView.validatedText(validationType: ValidatorType.requiredField(field: Constants.desriptionLabel))
            try _ = urlTextField.validatedText(validationType: ValidatorType.url)
            
            navigationItem.rightBarButtonItem?.isEnabled = true
        } catch {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
}
