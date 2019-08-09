//
//  Marks.swift
//  dreamteam
//
//  Created by Holofox on 04.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

@objc enum Marks : Int {
    case green, yellow, red
    
    func color() -> UIColor {
        switch self {
            case .green: return #colorLiteral(red: 0.403436912, green: 0.8980392157, blue: 0.5160145532, alpha: 1)
            case .yellow: return #colorLiteral(red: 0.965166176, green: 0.8705441644, blue: 0.2390042265, alpha: 1)
            case .red: return #colorLiteral(red: 1, green: 0.4182482217, blue: 0.5368555983, alpha: 1)
        }
    }
}
