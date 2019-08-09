//
//  GroupListViewController.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit
import RealmSwift

protocol GroupListView : class {
    func updateGroupList(groups: Results<RealmGroupItem>) -> ()
}

class GroupListViewController: UIViewController {
    
    var presenter: GroupListPresentation!
    var notificationToken: NotificationToken? = nil
    var datasource: Results<RealmGroupItem>?
    
    let tableView: UITableView = {
        let tableView = UITableView()
            tableView.backgroundColor = Color.backgroundColor
            tableView.rowHeight = UITableView.automaticDimension
            tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        setupLayout()
        setupNavBarButtons()
        groupsObserver()
    }
    
    fileprivate func setupLayout() {
        self.tableView.dataSource = self
        self.tableView.register(GroupListTableViewCell.self, forCellReuseIdentifier: GroupListTableViewCell.reuseIdentifier)

        self.view.addSubview(self.tableView)
        self.tableView.fillSuperview()
    }
    
    private func setupNavBarButtons() {
        let addButton = UIBarButtonItem(image: UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAdd))
        
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    @objc func handleAdd() {
        let controller = GroupAddBuilder.build()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    fileprivate func groupsObserver() {
        // Observe Results Notifications
        notificationToken = datasource?.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            
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

extension GroupListViewController : GroupListView {
    func updateGroupList(groups: Results<RealmGroupItem>) {
        self.datasource = groups
    }
}