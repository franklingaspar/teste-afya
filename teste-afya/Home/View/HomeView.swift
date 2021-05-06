//
//  HomeView.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation
import UIKit

class HomeView: BaseView {
    
    //MARK:views
    let tableView = UITableView()
    
    override func initView() {
        self.backgroundColor = .colorByHexDecimal(hex: ConstantsColor.tableBackground)
        tableView.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: "cellOne")
    }
    
    override func setupViews() {
        self.addSubview(tableView)
        
        tableView.anchor(top: self.compatibleSafeAreaLayoutGuide.topAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 10, left: self.leftAnchor, paddingLeft: 10, right: self.rightAnchor, paddingRight: 10, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
        
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! HomeViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
