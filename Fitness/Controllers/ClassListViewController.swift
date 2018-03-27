//
//  ClassListViewController.swift
//  Fitness
//
//  Created by Keivan Shahida on 3/21/18.
//  Copyright © 2018 Keivan Shahida. All rights reserved.
//

import UIKit
import SnapKit

class ClassListViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - INITIALIZATION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(ClassListHeaderView.self, forHeaderFooterViewReuseIdentifier: "classListHeader")
        tableView.register(ClassListCell.self, forCellReuseIdentifier: "classListCell")
        
        let searchBar = SearchBar.createSearchBar()
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        
        let filterBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(filter))
        self.navigationItem.rightBarButtonItem = filterBarButton
        
        view.backgroundColor = .white
    }
    
    // MARK: - TABLEVIEW
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //temp
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classListCell", for: indexPath) as! ClassListCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "classListHeader") as! ClassListHeaderView
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 155
    }
    
    // MARK: - SEARCH BAR
    @objc func filter(){
        print("filter!")
    }
}