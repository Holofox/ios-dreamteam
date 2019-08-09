//
//  AddViewController+Delegate.swift
//  dreamteam
//
//  Created by Holofox on 08.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

extension AddViewController : UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        validateFields()
        scrollView.updateContentView()
    }
}
