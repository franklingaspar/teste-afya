//
//  SearchView.swift
//  teste-afya
//
//  Created by Magna on 10/05/21.
//

import Foundation
import UIKit

protocol SearchViewProtocool {
    func clickSerie(serie: Show)
}

class SearchView: BaseView {
    
    //MARK: variable
    var listSearch = [Search]()
    var delegate: SearchViewProtocool?
    
    //MARK: views
    let tableView = UITableView()
    
    //MARK: live cycle
    override func initView() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        tableView.register(SearchViewCell.self, forCellReuseIdentifier: "cellOne")
    }
    
    override func setupViews() {
        self.addSubview(tableView)
        
        tableView.anchor(top: self.compatibleSafeAreaLayoutGuide.topAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: self)
    }
}

extension SearchView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSearch.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! SearchViewCell
        if !listSearch.isEmpty {
            cell.populateView(listSearch[indexPath.row])
        }
       
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.clickSerie(serie: listSearch[indexPath.row].show)
    }
}
