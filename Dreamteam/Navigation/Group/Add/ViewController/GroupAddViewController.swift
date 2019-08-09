//
//  GroupAddViewController.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit
import RealmSwift

protocol GroupAddView : class {
    func updateList(entries: Results<RealmEntryItem>) -> ()
}

class GroupAddViewController: UIViewController {
    
    var presenter: GroupAddPresentation!
    var notificationToken: NotificationToken? = nil
    var datasource: Results<RealmEntryItem>?
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
    
    let entriesLabel: UILabel = {
        let label = UILabel()
            label.text = Constants.entries
            label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let entriesTableView: UITableView = {
        let tableView = UITableView()
            tableView.backgroundColor = Color.backgroundColor
            tableView.rowHeight = UITableView.automaticDimension
            tableView.separatorStyle = .none
        
        return tableView
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
        presenter?.viewDidLoad()
        
        setupNavBarButtons()
        setupLayout()
        entriesObserver()
    }
    
    fileprivate func setupNavBarButtons() {
        let addButton = UIBarButtonItem(title: Constants.add, style: .plain, target: self, action: #selector(handleAdd))
            addButton.isEnabled = false
        
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    fileprivate func setupLayout() {
        
        view.addSubview(self.scrollView)
        scrollView.fillSuperview()
        
        let views = [titleLabel, titleTextField, descriptionLabel, descriptionTextView, urlLabel, urlTextField, entriesLabel, entriesTableView, markLabel, markStackView]
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
        
        // Entries list
        entriesLabel.anchor(top: urlTextField.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        entriesTableView.anchor(top: entriesLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 100))
        
        // Marks section
        markLabel.anchor(top: entriesTableView.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        markStackView.anchor(top: markLabel.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        generateMarkButtons()
        
        self.view.layoutIfNeeded()
        self.scrollView.updateContentView()
        
        [titleTextField, urlTextField].forEach({ $0.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged) })
        
        self.entriesTableView.dataSource = self
        self.entriesTableView.allowsMultipleSelection = true
        self.entriesTableView.register(GroupAddEntryTableViewCell.self, forCellReuseIdentifier: GroupAddEntryTableViewCell.reuseIdentifier)
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
    
    @objc fileprivate func handleAdd() {
        // Add group
        
        let selectedRows = entriesTableView.indexPathsForSelectedRows
        let selectedData = selectedRows?.compactMap{ datasource?[$0.row]}
        let selectedItems = selectedData?.compactMap({EntryItem(realmListItem: $0)})
        
        let groupItem = GroupItem(
            title: titleTextField.text!,
            desc: descriptionTextView.text,
            mark: self.selectedMark,
            picturePath: urlTextField.text!,
            entries: selectedItems ?? []
        )
        
        presenter?.onAddGroup(group: groupItem)
        
        self.navigationController?.popViewController(animated: true)
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
    
    fileprivate func entriesObserver() {
        // Observe Results Notifications
        notificationToken = datasource?.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.entriesTableView else { return }
            
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
}

extension GroupAddViewController : EntriesListView {
    func updateList(entries: Results<RealmEntryItem>) {
        self.datasource = entries
    }
}
