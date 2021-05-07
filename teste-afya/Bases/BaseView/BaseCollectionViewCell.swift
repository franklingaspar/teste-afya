//
//  BaseCollectionViewCell.swift
//  teste-afya
//
//  Created by Magna on 07/05/21.
//

import Foundation
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}
    
    func initView() {}
}
