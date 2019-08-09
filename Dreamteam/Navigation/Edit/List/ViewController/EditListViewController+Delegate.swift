//
//  EditListViewController+Delegate.swift
//  dreamteam
//
//  Created by Holofox on 08.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

extension EditListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = EditDetailBuilder.build(entry: self.datasource?[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
