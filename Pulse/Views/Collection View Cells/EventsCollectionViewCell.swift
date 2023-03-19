//
//  EventsCollectionViewCell.swift
//  Pulse
//
//  Created by Soham Nagawanshi on 3/8/23.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    // attributes
    var organizerImage: UIImage?
    private var imageView: UIImageView = UIImageView()
    // inits
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // life cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        self.organizerImage = nil
    }
    
    // layout subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        // configure background appearance
        self.contentView.layer.cornerRadius = Constants.cornerRadius
        self.contentView.layer.masksToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        layer.masksToBounds = true
//         set up image view
        setupImageView()
    }
}
//MARK: - Setup UI
extension EventsCollectionViewCell {
    func setupImageView()  {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = organizerImage
        self.contentView.addSubview(imageView)
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
}
