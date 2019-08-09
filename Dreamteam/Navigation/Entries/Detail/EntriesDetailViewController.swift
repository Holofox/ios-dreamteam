//
//  EntriesDetailViewController.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class EntriesDetailViewController: UIViewController {
    
    var presenter: EntriesDetailPresentation!
    
    var entry: RealmEntryItem? {
        didSet {
            setupAttachmentImage()

            descriptionLabel.text = entry?.desc
            markLabel.layer.backgroundColor = entry?.mark.color().cgColor
        }
    }
    
    private func setupAttachmentImage() {
        if let imageUrl = entry?.picturePath {
            attachmentImageView.loadImageUsingUrlString(urlString: imageUrl)
        }
    }
    
    let attachmentImageView: CustomUIImageView = {
        let imageView = CustomUIImageView()
            imageView.backgroundColor = Color.backgroundColor
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let markLabel: UILabel = {
        let label = UILabel()
            label.layer.cornerRadius = 5
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupLayout()
    }

    fileprivate func setupNavigationBar() {
        self.navigationItem.title = entry?.title
    }
    
    fileprivate func setupLayout() {
        
        let views = [attachmentImageView, descriptionLabel, markLabel]
            views.forEach (self.view.addSubview(_:))
        
        self.view.backgroundColor = Color.backgroundColor
        
        // attachmentImageView
        attachmentImageView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: 0, height: 250))
        
        // descriptionLabel
        descriptionLabel.anchor(top: attachmentImageView.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        
        // markLabel
        markLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: descriptionLabel.trailingAnchor, size: .init(width: 10, height: 10))
        markLabel.centerYAnchor.constraint(equalTo: (descriptionLabel.centerYAnchor)).isActive = true
    }
    
}
