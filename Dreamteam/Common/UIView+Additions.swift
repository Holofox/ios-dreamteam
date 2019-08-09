//
//  UIView+Additions.swift
//  dreamteam
//
//  Created by Holofox on 04.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit


// MARK: Auto Layout Constraint

extension UIView {
    
    enum ConstraintType {
        case top, leading, trailing, bottom, width, height
    }
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> [ConstraintType : NSLayoutConstraint] {
        
        // Translate the view's autoresizing mask into Auto Layout constraints
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [ConstraintType : NSLayoutConstraint] = [:]
        
        if let top = top {
            constraints[.top] = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            constraints[.leading] = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            constraints[.bottom] = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            constraints[.trailing] = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            constraints[.width] = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            constraints[.height] = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        let constraintsArray = Array<NSLayoutConstraint>(constraints.values)
        NSLayoutConstraint.activate(constraintsArray)
        
        return constraints
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        
        // Translate the view's autoresizing mask into Auto Layout constraints
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [ConstraintType : NSLayoutConstraint] = [:]
        
        if let superviewTopAnchor = superview?.topAnchor {
            constraints[.top] = topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top)
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            constraints[.bottom] = bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom)
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            constraints[.leading] = leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left)
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            constraints[.trailing] = trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right)
        }
        
        let constraintsArray = Array<NSLayoutConstraint>(constraints.values)
        NSLayoutConstraint.activate(constraintsArray)
        
    }

    func fillSafeSuperview(padding: UIEdgeInsets = .zero) {
        
        // Translate the view's autoresizing mask into Auto Layout constraints
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [ConstraintType : NSLayoutConstraint] = [:]
        
        if let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor {
            constraints[.top] = topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top)
        }
        
        if let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor {
            constraints[.bottom] = bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom)
        }
        
        if let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor {
            constraints[.leading] = leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left)
        }
        
        if let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor {
            constraints[.trailing] = trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right)
        }
        
        let constraintsArray = Array<NSLayoutConstraint>(constraints.values)
        NSLayoutConstraint.activate(constraintsArray)
        
    }
    
}

// MARK: Refactoring UIColor

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
