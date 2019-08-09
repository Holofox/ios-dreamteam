//
//  AddViewController.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit
import Foundation

protocol AddView : class {
    
}

class AddViewController: UIViewController {
    
    var presenter: AddPresentation!
    var selectedMark: Marks = .green
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
            scrollView.backgroundColor = Color.backgroundColor
        
        return scrollView
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
    
    let markLabel: UILabel = {
        let label = UILabel()
            label.text = Constants.markLabel
            label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }()

    let markStackView: UIStackView = {
        let stackView = UIStackView()
            stackView.spacing = 10
        
        return stackView
    }()
    
    fileprivate var markButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBarButtons()
        setupLayout()
    }
    
    fileprivate func setupNavBarButtons() {
        let doneButton = UIBarButtonItem(title: Constants.done, style: .plain, target: self, action: #selector(handleDone))
            doneButton.isEnabled = false
        
        navigationItem.rightBarButtonItems = [doneButton]
    }
    
    fileprivate func setupLayout() {
        
        view.addSubview(self.scrollView)
        scrollView.fillSuperview()
        
        let views = [titleLabel, titleTextField, descriptionLabel, descriptionTextView, urlLabel, urlTextField, markLabel, markStackView]
            views.forEach (scrollView.addSubview(_:))
        
        // Title section
        titleLabel.anchor(top: scrollView.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        titleTextField.anchor(top: titleLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        // Description section
        descriptionLabel.anchor(top: titleTextField.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        descriptionTextView.anchor(top: descriptionLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        descriptionTextView.delegate = self
        
        // Label section
        urlLabel.anchor(top: descriptionTextView.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        urlTextField.anchor(top: urlLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))

        // Marks section
        markLabel.anchor(top: urlTextField.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        markStackView.anchor(top: markLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        generateMarkButtons()
        
        self.view.layoutIfNeeded()
        self.scrollView.updateContentView()

        [titleTextField, urlTextField].forEach({ $0.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged) })
    }
    
    fileprivate func generateMarkButtons() {
        for i in 0...2 {
            let button = UIButton()
                button.tag = i
                button.frame.size = CGSize(width: 30, height: 30)
                button.layer.cornerRadius = button.frame.width/2
                button.alpha = (button.tag != 0 ? 0.25 : 1)
                button.backgroundColor = Marks.init(rawValue: i)?.color()
                button.addTarget(self, action: #selector(handleSelectMark(sender:)), for: .touchUpInside)
            
            self.markButtons.append(button)
            self.markStackView.addArrangedSubview(self.markButtons[i])
        }
    }
    
    @objc fileprivate func handleSelectMark(sender: UIButton) {
        guard
            let mark = Marks.init(rawValue: sender.tag)
            else { return }
        
        self.selectedMark = mark
        
        for button in self.markButtons {
            button.alpha = (button != sender ? 0.25 : 1)
        }
    }
    
    @objc fileprivate func handleDone() {
        
        let entryItem = EntryItem(
            title: titleTextField.text!,
            desc: descriptionTextView.text,
            mark: selectedMark,
            picturePath: urlTextField.text!
        )
        
        self.presenter.onAddEntry(item: entryItem)
        tabBarController?.selectedIndex = 0
        
        resetFields()
    }
    
    @objc fileprivate func textFieldEditingChanged(_ textField: UITextField) {
        validateFields()
    }
    
    func validateFields() {
        do {
            let _ = try titleTextField.validatedText(validationType: ValidatorType.requiredField(field: Constants.titleLabel))
            let _ = try descriptionTextView.validatedText(validationType: ValidatorType.requiredField(field: Constants.desriptionLabel))
            let _ = try urlTextField.validatedText(validationType: ValidatorType.url)
            
            navigationItem.rightBarButtonItem?.isEnabled = true
        } catch {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    fileprivate func resetFields() {
        [titleTextField, urlTextField].forEach({ $0.text?.removeAll()})
        descriptionTextView.text.removeAll()
        
        for button in self.markButtons {
            button.alpha = (button.tag == 0 ? 1 : 0.25)
        }
        
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
}

extension AddViewController : AddView {

}
