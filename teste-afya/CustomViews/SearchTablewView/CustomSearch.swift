//
//  File.swift
//  teste-afya
//
//  Created by Magna on 09/05/21.
//

import UIKit

class CustomSearch: NSObject {
    
    //MARK: variables
    var list = [Search]()
    var timerCreateAlert: Timer!
    var completionHandler: (Show) -> Void = {_ in }
    
    //MARK: views
    let tableView = UITableView()
    private var mytargetView: UIView?
    
    //MARK: init
    func showCustomSearch(list: [Search], on viewController: UIViewController, completionHandler:  @escaping (Show) -> Void) {
        self.mytargetView = viewController.view
        initViews()
        self.list = list
        self.completionHandler = completionHandler
    }
    
    private func initViews() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        tableView.register(CustomSearchViewCell.self, forCellReuseIdentifier: "cellOne")
        
        mytargetView?.addSubview(tableView)
        
        tableView.anchor(top: mytargetView?.compatibleSafeAreaLayoutGuide.topAnchor, paddingTop: 0, bottom: mytargetView?.bottomAnchor, paddingBottom: 0, left: mytargetView?.leftAnchor, paddingLeft: 0, right: mytargetView?.rightAnchor, paddingRight: 0, width: 0, height: 0, centerVertical: false, centerHorizontal: false, view: mytargetView!)
        
        mytargetView?.layoutIfNeeded()
    }
    
}

extension CustomSearch: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! CustomSearchViewCell
        cell.populateViews(serie: list[indexPath.row].show)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completionHandler(list[indexPath.row].show)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
}

