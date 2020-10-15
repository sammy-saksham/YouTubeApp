//
//  Constants.swift
//  YouTube
//
//  Created by Saksham Jain on 09/10/20.
//

import Foundation

struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = ""
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
    
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}
