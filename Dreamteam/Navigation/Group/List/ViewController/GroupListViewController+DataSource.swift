//
//  GroupListViewController+DataSource.swift
//  dreamteam
//
//  Created by Holofox on 09.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

extension GroupListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupListTableViewCell.reuseIdentifier, for: indexPath) as! GroupListTableViewCell
            cell.selectionStyle = .none
            cell.groupItem = datasource?[indexPath.item]
        
        return cell
    }
}
