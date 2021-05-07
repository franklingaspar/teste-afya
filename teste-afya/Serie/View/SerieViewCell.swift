//
//  SerieViewCell.swift
//  teste-afya
//
//  Created by Magna on 07/05/21.
//

import Foundation
import UIKit

class SerieViewCell: BaseViewCell {
    //MARK: views
    
    let img: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    let name = UILabel.makeBigText(title: "")
    let genere = UILabel.makeMediumText(title: "Gênero: ")
    let resume = UILabel.makeMediumText(title: "Resumo: ")
    let program = UILabel.makeMediumText(title: "Programação: ")
    
    //MARK: live cycle
    override func initView() {
        self.backgroundColor = .colorByHexDecimal(hex: ConstantsColor.tableBackground)
    }
    
    override func setupViews() {
        self.addSubview(img)
        self.addSubview(name)
        self.addSubview(genere)
        self.addSubview(resume)
        self.addSubview(program)
        
        img.anchor(top: self.topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 10, right: nil, paddingRight: 10, width: 200, height: 250, centerVertical: false, centerHorizontal: true, view: self)
        
        name.anchor(top: img.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 20, right: self.rightAnchor, paddingRight: 20, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
        
        genere.anchor(top: name.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: name.leftAnchor, paddingLeft: 0, right: name.rightAnchor, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
        
        resume.anchor(top: genere.bottomAnchor, paddingTop: 5, bottom: nil, paddingBottom: 0, left: name.leftAnchor, paddingLeft: 0, right: name.rightAnchor, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
        
        program.anchor(top: resume.bottomAnchor, paddingTop: 5, bottom: self.bottomAnchor, paddingBottom: 10, left: name.leftAnchor, paddingLeft: 0, right: name.rightAnchor, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
        
    }
    
    func populateView(_ serie: Show) {
        img.downloaded(from: (serie.image?.medium)!)
        name.text = serie.name
        paidText(label: genere, text: getGeneres(serie.genres!))
        paidText(label: resume, text: (serie.summary)!)
        paidText(label: program, text: getDays((serie.schedule?.days)!))
    }
    
    private func getGeneres(_ genres: [String]) -> String {
        return genres.joined(separator:",")
    }
    
    private func getDays(_ genres: [String]) -> String {
        return genres.joined(separator:",")
    }
    
    private func paidText(label: UILabel, text: String) {
        
        let stringComplete = String(format: label.text! + text)
        
        let string = (stringComplete as NSString).range(of: text)
        let attributedString = NSMutableAttributedString(string: stringComplete)
        
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.colorByHexDecimal(hex: ConstantsColor.grayLabel)],range: string)
        
        label.text = stringComplete
        label.attributedText = attributedString
    }
}
