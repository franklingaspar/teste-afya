//
//  SerieView.swift
//  teste-afya
//
//  Created by Magna on 07/05/21.
//

import Foundation
import UIKit

class SerieView: BaseView {
    
    //MARK: variable

    var serie: Show?
        
    //MARK: views
    let tableView = UITableView()
    
    
    //MARK: livecycler
    override func initView() {
        self.backgroundColor = .colorByHexDecimal(hex: ConstantsColor.tableBackground)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        tableView.register(SerieViewCell.self, forCellReuseIdentifier: "cellOne")
        
    }
    
    override func setupViews() {
        self.addSubview(tableView)
        
        tableView.anchor(top: self.compatibleSafeAreaLayoutGuide.topAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
    }

    
}
extension SerieView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! SerieViewCell
        cell.populateView(serie!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
