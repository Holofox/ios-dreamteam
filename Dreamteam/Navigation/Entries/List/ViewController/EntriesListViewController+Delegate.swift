//
//  EntriesListViewController+Delegate.swift
//  dreamteam
//
//  Created by Holofox on 07.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

extension EntriesListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = EntriesDetailBuilder.build(entry: self.datasource?[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
