//
//  Notifications.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation

struct Notifications {
    // GENERIC
    static let GenericError = NSNotification.Name("GenericError")
    
    // POSTS
    static let PostsStartLoading = NSNotification.Name("PostsStartLoading")
    static let PostsDidLoad = NSNotification.Name("PostsDidLoad")
    static let PostsDidError = NSNotification.Name("PostsDidError")
    
    // ALBUMS
    static let AlbumsDidLoad = NSNotification.Name("AlbumsDidLoad")
    static let AlbumsDidError = NSNotification.Name("AlbumsDidError")
    static let CommentsDidLoad = NSNotification.Name("CommentsDidLoad")
    static let CommentsDidError = NSNotification.Name("CommentsDidError")
    
    // TASKS
    static let TasksDidLoad = NSNotification.Name("TasksDidLoad")
    static let TasksDidError = NSNotification.Name("TasksDidError")
}
