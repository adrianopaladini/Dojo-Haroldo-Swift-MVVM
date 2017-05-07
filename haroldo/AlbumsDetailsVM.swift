//
//  AlbumsDetailsVM.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation
import RealmSwift

class AlbumDetailsVM {
    let albumsOP = AlbumsOP()
    var comments: [Comment] = []
    var details: [Album] = []
    
    func loadData(for type: String, with albumId: Int, completion: @escaping(Void) -> () ) {
        if type == "comments" {
            albumsOP.getComments(for: albumId) { results in
                if let allComments = results {
                    self.comments = allComments
                }
                
                completion()
            }
            
        } else {
            albumsOP.getAlbum(for: albumId)  { results in
                if let detail = results {
                    self.details = [detail]
                }
                
                completion()
            }
        }
    }
    
    func populateCommentsCell(table: UITableView, indexPath: IndexPath) -> AlbumCommentCell{
        let cell = table.dequeueReusableCell(withIdentifier: "AlbumCommentCell") as! AlbumCommentCell
        let comment = comments[indexPath.row]
        
        cell.body.text = comment.body
        cell.email.text = comment.email
        cell.name.text =  comment.name
        
        return cell
    }
    
    func populateDetailCell(table: UITableView, indexPath: IndexPath) -> AlbumDetailCell{
        let cell = table.dequeueReusableCell(withIdentifier: "AlbumDetailCell") as! AlbumDetailCell
        let detail = details[indexPath.row]
        
        cell.author.text = "String de teste"
        cell.title.text = detail.title
        
        return cell
    }
}

