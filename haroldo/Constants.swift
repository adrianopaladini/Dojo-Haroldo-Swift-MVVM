//
//  Constants.swift
//  haroldo
//
//  Created by Mateus Pinheiro on 25/01/17.
//  Copyright © 2017 MAT. All rights reserved.
//

import Foundation

struct Constants {
    static let apiUrl = "https://jsonplaceholder.typicode.com/"
    
    static let albumCovers: [String] = [
        "http://www.designformusic.com/wp-content/uploads/2015/10/insurgency-digital-album-cover-design.jpg",
        "http://illusion.scene360.com/wp-content/uploads/2014/10/computergraphics-album-covers-2014-15.jpg",
        "https://le0pard13.files.wordpress.com/2013/08/pink-floyd-dark-side-of-the-moon-album-cover.jpg",
        "http://www.fuse.tv/image/56fe73a1e05e186b2000009b/768/512/the-boxer-rebellion-ocean-by-ocean-album-cover-full-size.jpg",
        "https://static1.squarespace.com/static/512b8e2ce4b0dc8d3de0e842/t/5673ce0ca12f44b15d83f713/1450429981542/",
        "http://6uh9u7hhy8-flywheel.netdna-ssl.com/wp-content/uploads/2016/03/beyonce-formation-tracklist-1.jpg",
        "http://artsfuse.org/wp-content/uploads/2011/04/Adele-21-Album-Cover-Art-500x500.png",
        "http://www.billboard.com/files/styles/900_wide/public/media/Joy-Division-Unknown-Pleasures-album-covers-billboard-1000x1000.jpg",
        "http://www.designformusic.com/wp-content/uploads/2015/12/Taking-The-High-Road-500x500.jpg",
        "http://illusion.scene360.com/wp-content/uploads/2013/10/album-covers-05.jpg",
        "https://tartillos.files.wordpress.com/2011/07/eminem-recovery-official-album-cover.jpg",
        "http://www.imusiciandigital.com/wp-content/uploads/2015/03/nevermind400.jpg",
        "http://cdn-img.instyle.com/sites/default/files/styles/684xflex/public/1445388522/102015-rihanna1.jpg?itok=aQFSSopv",
        "https://s-media-cache-ak0.pinimg.com/originals/e2/13/50/e21350a1366a1ca0098b0f152c103982.jpg",
        "http://d817ypd61vbww.cloudfront.net/sites/default/files/tile/image/A-116-03comp_0.jpg",
        "https://cdn.tutsplus.com/psd/uploads/legacy/0612_Typographic_Covers/Kiss_first_album_cover.jpg",
        "http://2.bp.blogspot.com/-kKxIdYfgMv0/TV97Glu1stI/AAAAAAAABKU/7a8eIhrL0t8/s1600/Bob_Dylan_-_The_Times_They_are_a-Changin.jpg",
        "https://ainhoaaristizabal.files.wordpress.com/2013/12/imagine-dragons-night-visions-album-cover-640x640.jpg",
        "https://lh3.googleusercontent.com/-FGILtwdtfVI/TXFDexd2wyI/AAAAAAAABOI/Hx9bALbsdoU/s1600/Pink_Floyd_-_The_Division_Bell.jpg"
    ]
    
    static func randomAlbumUrl() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(Constants.albumCovers.count)))
        return Constants.albumCovers[randomIndex]
    }
}
