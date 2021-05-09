//
//  SearchViewCell.swift
//  teste-afya
//
//  Created by Magna on 09/05/21.
//

import Foundation
import UIKit

class CustomSearchViewCell: BaseViewCell {
    
    //MARK:views
    private let img: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let name = UILabel.makeMediumText(title: "")
    
    //MARK: live cycle
    override func setupViews() {
        self.addSubview(img)
        self.addSubview(name)
        
        img.anchor(top: self.topAnchor, paddingTop: 10, bottom: self.bottomAnchor, paddingBottom: 10, left: self.leftAnchor, paddingLeft: 10, right: nil, paddingRight: 0, width: 50, height: 100, centerVertical: false, centerHorizontal: false, view: self)
        
        name.anchor(top: img.topAnchor, paddingTop: 0, bottom: img.bottomAnchor, paddingBottom: 0, left: img.rightAnchor, paddingLeft: 10, right: self.rightAnchor, paddingRight: 10, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
    }
    
    //MARK: functions
    func populateViews(serie: Show) {
        img.downloaded(from: (serie.image?.medium)!)
        name.text = serie.name
    }
}
