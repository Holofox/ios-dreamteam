//
//  AddRouter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

protocol AddRouting {
    
}

class AddRouter {
    var viewController: UIViewController
    
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension AddRouter : AddRouting {
    
}
