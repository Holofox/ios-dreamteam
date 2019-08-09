//
//  EntriesListViewController+DataSource.swift
//  dreamteam
//
//  Created by Holofox on 07.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

extension EntriesListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryListTableViewCell.reuseIdentifier, for: indexPath) as! EntryListTableViewCell
            cell.selectionStyle = .none
            cell.entryItem = datasource?[indexPath.item]
        
        return cell
    }
}
