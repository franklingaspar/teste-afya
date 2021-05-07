//
//  HomeViewCell.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation
import UIKit

class HomeViewCell: BaseCollectionViewCell {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.makeShadow()
        view.layer.cornerRadius = 5
        return view
    }()
    
    override func prepareForReuse() {
        imageView.image =  #imageLiteral(resourceName: "img-placeholder")
    }
    
    override func setupViews() {
        self.contentView.addSubview(imageView)
        
        imageView.anchor(top: self.topAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
    }
    
    func populateView(show: Show) {        
        imageView.downloaded(from: (show.image?.original)!)
    }
    
}
