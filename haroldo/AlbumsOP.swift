//
//  AlbumsOP.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import AlamofireObjectMapper

class AlbumsOP {
    let utilityQueue = DispatchQueue(label: "utility", qos: .utility, target: nil)
    let notificationCenter = NotificationCenter.default
    let realm = try! Realm()
    
    func getAllAlbums() {
        utilityQueue.async {
            Alamofire.request(Constants.apiUrl + "albums").responseArray { (response: DataResponse<[Album]>) in
                guard
                    let albums = response.result.value,
                    self.saveAlbums(albums)
                    else { self.notificationCenter.post(name: Notifications.AlbumsDidError, object: nil); return }
                
                self.notificationCenter.post(name: Notifications.AlbumsDidLoad, object: nil)
            }
        }

    }
    
    func getComments(for albumId: Int, with completion: @escaping(_: [Comment]?) -> Void) {
        utilityQueue.async {
            Alamofire.request("\(Constants.apiUrl)comments").responseArray { (response: DataResponse<[Comment]>) in
                guard
                    let comments = response.result.value
                    else { completion(nil); return }
                
                completion(comments)
            }
        }

    }
    
    func getAlbum(for albumId: Int, with completion: @escaping(_: Album?) -> Void) {
        guard
            let alb = self.realm.object(ofType: Album.self, forPrimaryKey: albumId)
            else { completion(nil); return }
        
        completion(alb)
        
    }
    
    
    func saveAlbums(_ albums: [Album]) -> Bool {
        do {
            try self.realm.write {
                for album in albums {
                    album.cover = Constants.randomAlbumUrl()
                    self.realm.add(album, update: true)
                }
            }
            return true
        } catch {
            return false
        }
    }

}
