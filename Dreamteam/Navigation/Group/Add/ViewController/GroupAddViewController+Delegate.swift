//
//  GroupAddViewController+Delegate.swift
//  dreamteam
//
//  Created by Holofox on 09.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

extension GroupAddViewController : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        validateFields()
        scrollView.updateContentView()
    }
}
