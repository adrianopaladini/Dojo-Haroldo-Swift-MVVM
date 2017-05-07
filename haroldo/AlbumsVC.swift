//
//  AlbumsVC.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import UIKit
import AlamofireImage

class AlbumsVC: UITableViewController {
    let vm = AlbumsVM()
    var state: States = .ready
    let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        state = vm.state
        self.refreshControl?.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 30
        
        notificationCenter.addObserver(forName: Notifications.AlbumsDidLoad, object: nil, queue: nil, using: self.reloadData)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return vm.populateAlbumCell(table: tableView, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toAlbumDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! AlbumDetailsVC
        guard
            let indexAb = tableView.indexPathForSelectedRow?.row
            else { return }
        
        destVC.albumId = vm.albums[indexAb].id
    }
    
    
    func refresh(){
        vm.pullToRefresh()
    }
    
    func reloadData (_: Notification) -> Void{
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
}
