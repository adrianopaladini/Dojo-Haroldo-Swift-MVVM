//
//  AlbumsVM.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation
import RealmSwift

class AlbumsVM {
    let realm = try! Realm()
    let albumsOP = AlbumsOP()
    
    var state: States = .ready
    var albums: Results<Album>
    
    init() {
        albumsOP.getAllAlbums()
        albums = realm.objects(Album.self)
    }
    
    func populateAlbumCell (table: UITableView, indexPath: IndexPath) -> AlbumCell{
        let cell = table.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        let album = albums[indexPath.row]
        let imageUrl = URL(string: album.cover)
        
        cell.title.text = album.title
        cell.author.text = "João"
        
        if imageUrl != nil {
            cell.cover.af_setImage(withURL: imageUrl!, placeholderImage: #imageLiteral(resourceName: "album-placeholder"))
        } else {
            cell.cover.image = #imageLiteral(resourceName: "album-placeholder")
        }
        
        return cell
    }
    
    func pullToRefresh(){
        albumsOP.getAllAlbums()
    }
}
