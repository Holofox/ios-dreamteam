//
//  GroupAddViewController+DataSource.swift
//  dreamteam
//
//  Created by Holofox on 08.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

extension GroupAddViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupAddEntryTableViewCell.reuseIdentifier, for: indexPath) as! GroupAddEntryTableViewCell
            cell.selectionStyle = .none
            cell.textLabel?.text = datasource?[indexPath.row].title
        
        return cell
    }
}
