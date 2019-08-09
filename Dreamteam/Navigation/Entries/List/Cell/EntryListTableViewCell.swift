//
//  EntryListTableViewCell.swift
//  dreamteam
//
//  Created by Holofox on 06.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class EntryListTableViewCell: BaseTableViewCell {
    
    static let reuseIdentifier = "EntryListCell"
    
    var entryItem: RealmEntryItem? {
        didSet {
            setupAttachmentImage()
            
            titleLabel.text = entryItem?.title
            descriptionTextView.text = entryItem?.desc
            markLabel.layer.backgroundColor = entryItem?.mark.color().cgColor
        }
    }
    
    private func setupAttachmentImage() {
        if let imageUrl = entryItem?.picturePath {
            attachmentImageView.loadImageUsingUrlString(urlString: imageUrl)
        }
    }
    
    let attachmentImageView: CustomUIImageView = {
        let imageView = CustomUIImageView()
            imageView.backgroundColor = Color.backgroundColor
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        
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
        
        let view = [attachmentImageView, titleLabel, descriptionTextView, markLabel, separatorView]
            view.forEach (addSubview(_:))

        // attachmentImageView
        attachmentImageView.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 8, right: 0), size: .init(width: 0, height: 250))
        
        // titleLabel
        titleLabel.anchor(top: attachmentImageView.bottomAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 8, right: 16))

        // descriptionTextView
        descriptionTextView.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor)
        
        // markLabel
        markLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: titleLabel.trailingAnchor, size: .init(width: 10, height: 10))
        markLabel.centerYAnchor.constraint(equalTo: (titleLabel.centerYAnchor)).isActive = true
        
        // separatorView
        separatorView.anchor(top: descriptionTextView.bottomAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 1))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

