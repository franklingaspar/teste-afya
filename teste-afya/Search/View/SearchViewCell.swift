//
//  SearchViewCell.swift
//  teste-afya
//
//  Created by Magna on 10/05/21.
//

import Foundation
import UIKit

class SearchViewCell: BaseViewCell {
    
    //MARK: views
    let img: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    let name = UILabel.makeMediumText(title: "")
    
    //MARK: live cycle
    
    override func setupViews() {
        self.addSubview(img)
        self.addSubview(name)
        
        img.anchor(top: self.topAnchor, paddingTop: 10, bottom: self.bottomAnchor, paddingBottom: 10, left: self.leftAnchor, paddingLeft: 10, right: nil, paddingRight: 10, width: 100, height: 150, centerVertical: false, centerHorizontal: false, view: self)
        
        name.anchor(top: img.topAnchor, paddingTop: 20, bottom: img.bottomAnchor, paddingBottom: 0, left: img.rightAnchor, paddingLeft: 10, right: self.rightAnchor, paddingRight: 20, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
    }
    
    func populateView(_ serie: Search) {
        if let img = serie.show.image?.medium {
            self.img.downloaded(from: img)
        } else {
            img.image = #imageLiteral(resourceName: "img-placeholder")
        }
        
        name.text = serie.show.name
    }
    
}
