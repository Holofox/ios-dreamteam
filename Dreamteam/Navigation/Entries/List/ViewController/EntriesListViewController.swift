//
//  EntriesListViewController.swift
//  dreamteam
//
//  Created by Holofox on 04.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit
import RealmSwift

protocol EntriesListView : class {
    func updateList(entries: Results<RealmEntryItem>) -> ()
}

class EntriesListViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
            tableView.backgroundColor = Color.backgroundColor
            tableView.rowHeight = UITableView.automaticDimension
            tableView.separatorStyle = .none
        
        return tableView
    }()
    
    var presenter: EntriesListPresentation!
    var notificationToken: NotificationToken? = nil
    var datasource: Results<RealmEntryItem>?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        setupLayout()
        entriesObserver()
    }
    
    fileprivate func setupLayout() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(EntryListTableViewCell.self, forCellReuseIdentifier: EntryListTableViewCell.reuseIdentifier)
        
        self.view.addSubview(self.tableView)
        self.tableView.fillSuperview()
    }
    
    fileprivate func entriesObserver() {
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

extension EntriesListViewController : EntriesListView {
    func updateList(entries: Results<RealmEntryItem>) {
        self.datasource = entries
    }
}
