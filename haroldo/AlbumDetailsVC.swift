//
//  AlbumDetailsVC.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import UIKit

class AlbumDetailsVC: UITableViewController {
    var albumId = 0
    var vm = AlbumDetailsVM()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(albumId)
        
        vm.loadData(for: "album", with: albumId) { _ in
            self.tableView.reloadData()
        }
        vm.loadData(for: "comments", with: albumId) { _ in
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 30
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = [1, vm.comments.count]
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return vm.populateDetailCell(table: tableView, indexPath: indexPath)
        } else {
            return vm.populateCommentsCell(table: tableView, indexPath: indexPath)
        }
    
    }
    
}
