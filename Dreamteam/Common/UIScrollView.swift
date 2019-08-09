//
//  UIScrollView.swift
//  dreamteam
//
//  Created by Holofox on 07.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

extension UIScrollView {
    func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
    }
}
