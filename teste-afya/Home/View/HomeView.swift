//
//  HomeView.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation
import UIKit

protocol HomeViewProtocool {
    func clickNext()
    func clickPrevius()
    func clickSerie(serie: Show)
}

class HomeView: BaseView {
    
    //MARK:variables
    var delegate: HomeViewProtocool?
    var paginas = Int() {
        didSet {
            labelCount.text = "\(paginas)"
            if paginas == 1 {
                previusButton!.backgroundColor = .colorByHexDecimal(hex: ConstantsColor.tableBackground)
                previusButton!.isUserInteractionEnabled = false
            } else {
                previusButton!.backgroundColor = .colorByHexDecimal(hex: ConstantsColor.pink)
                previusButton!.isUserInteractionEnabled = true
            }
        }
    }
    var listSeries = [Show]() {
        didSet {
            collectionView.reloadData()
        }
    }

    //MARK:views
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let labelCount = UILabel.makeBigText(title: "")
    
    var previusButton: UIButton?
    var nextButton:UIButton?
    
    
    //MARK:live cycle
    override func initView() {
        self.backgroundColor = .colorByHexDecimal(hex: ConstantsColor.tableBackground)
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: "cellOne")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        previusButton = getButtom(title: "<")
        previusButton!.addTarget(self, action: #selector(clickPrevius), for: .touchUpInside)
        
        
        nextButton = getButtom(title: ">")
        nextButton!.addTarget(self, action: #selector(clickNext), for: .touchUpInside)
        
    }
    
    override func setupViews() {
        self.addSubview(collectionView)
        self.addSubview(labelCount)
        self.addSubview(previusButton!)
        self.addSubview(nextButton!)
        
        labelCount.anchor(top: self.compatibleSafeAreaLayoutGuide.topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: true, view: self)
        
        previusButton!.anchor(top: labelCount.topAnchor, paddingTop: 0, bottom: labelCount.bottomAnchor, paddingBottom: 0, left: nil, paddingLeft: 0, right: labelCount.leftAnchor, paddingRight: 10, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
        
        nextButton!.anchor(top: labelCount.topAnchor, paddingTop: 0, bottom: labelCount.bottomAnchor, paddingBottom: 0, left: labelCount.rightAnchor, paddingLeft: 10, right: nil, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
        
        collectionView.anchor(top: self.labelCount.bottomAnchor, paddingTop: 10, bottom: self.bottomAnchor, paddingBottom: 10, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
        
    }
    
    //MARK:functions
    private func getButtom(title: String) -> UIButton{
        let view = UIButton()
        view.backgroundColor = .colorByHexDecimal(hex: ConstantsColor.pink)
        view.layer.cornerRadius = 3
        view.setTitleColor(.white, for: .normal)
        view.setTitle(title, for: .normal)
        return view
    }
    
    //MARK:clicks
    @objc func clickNext(_ sender:UIButton){
        self.delegate?.clickNext()
    }
    
    @objc func clickPrevius(_ sender:UIButton){
        self.delegate?.clickPrevius()
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listSeries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as! HomeViewCell
        cell.populateView(show: listSeries[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (self.frame.size.width/3.4),
            height: (self.frame.size.width/2.5)
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        delegate?.clickSerie(serie: listSeries[indexPath.row])
    }
    
}
