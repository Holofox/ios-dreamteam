//
//  GroupListTableViewCell.swift
//  dreamteam
//
//  Created by Holofox on 09.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class GroupListTableViewCell: BaseTableViewCell {
    
    static let reuseIdentifier = "GroupListCell"
    
    var groupItem: RealmGroupItem? {
        didSet {
            setupAvatarImage()
            
            let entries = groupItem?.entries.map{ $0.title }.joined(separator: ", ")
            entriesTextView.text = entries
            
            titleLabel.text = groupItem?.title
            descriptionTextView.text = groupItem?.desc
            markLabel.layer.backgroundColor = groupItem?.mark.color().cgColor
        }
    }
    
    let entriesTextView: UITextView = {
        let textView = UITextView()
            textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
            textView.isEditable = false
            textView.isSelectable = false
            textView.isScrollEnabled = false
            textView.font = UIFont.systemFont(ofSize: 16)
        
        return textView
    }()
    
    private func setupAvatarImage() {
        if let imageUrl = groupItem?.picturePath {
            avatarImageView.loadImageUsingUrlString(urlString: imageUrl)
        }
    }
    
    let avatarImageView: CustomUIImageView = {
        let imageView = CustomUIImageView()
            imageView.backgroundColor = Color.backgroundColor
            imageView.layer.cornerRadius = 22
            imageView.layer.masksToBounds = true
            imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
            label.numberOfLines = 2
            label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
            textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
            textView.isEditable = false
            textView.isSelectable = false
            textView.isScrollEnabled = false
            textView.font = UIFont.systemFont(ofSize: 12)
        
        return textView
    }()
    
    let markLabel: UILabel = {
        let label = UILabel()
            label.layer.cornerRadius = 5
        
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
            view.backgroundColor = Color.backgroundColor
        
        return view
    }()
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let view = [entriesTextView, avatarImageView, titleLabel, descriptionTextView, markLabel, separatorView]
            view.forEach (addSubview(_:))
        
        // avatarImageView
        avatarImageView.anchor(top: titleLabel.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 44, height: 44))
        
        // titleLabel
        titleLabel.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: avatarImageView.trailingAnchor, bottom: descriptionTextView.topAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 4, right: 16))
        
        // descriptionTextView
        descriptionTextView.anchor(top: nil, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor)
        
        // markLabel
        markLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: titleLabel.trailingAnchor, size: .init(width: 10, height: 10))
        markLabel.centerYAnchor.constraint(equalTo: (titleLabel.centerYAnchor)).isActive = true
        
        // entriesTextView
        entriesTextView.anchor(top: descriptionTextView.bottomAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: separatorView.topAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 8, right: 0))
        
        // separatorView
        separatorView.anchor(top: nil, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 1))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

