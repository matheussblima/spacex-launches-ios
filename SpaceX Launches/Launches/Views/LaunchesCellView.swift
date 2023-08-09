//
//  launchesCellView.swift
//  SpaceX Launches
//
//  Created by Matheus  Lima  on 07/08/23.
//

import UIKit
import SDWebImage

class LaunchesCellView: UICollectionViewCell {
    static let identification = "LaunchesCellView"
    
    let container = UIStackView()
    var image = UIImageView()
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(item: LaunchMapped) {
        if let image = item.image {
            self.image.sd_setImage(with: URL(string: image))
        }
        
        self.label.text = item.name
        
    }
}

extension LaunchesCellView {
    func initialSetup() {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.axis = .vertical
        container.spacing = 16
        container.alignment = .center
        
        label.font = UIFont.preferredFont(forTextStyle: .title2)
    }
    
    func layout() {
        addSubview(container)
        container.addArrangedSubview(image)
        container.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            container.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: container.trailingAnchor, multiplier: 2),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
