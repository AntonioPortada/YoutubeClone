//
//  RequestModel.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 06/11/24.
//

import Foundation

struct RequestModel {
    
    let endpoint: Endpoints
    let httpMethod: HTTPMethod = .GET
    var queryItems: [String : String]?
    var baseURL: URLBase = .youtube
    
    func getURL() -> String {
        return baseURL.rawValue + endpoint.rawValue
    }
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    enum Endpoints: String {
        case empty = "/"
        case search = "/search"
        case channels = "/channels"
        case playlists = "/playlists"
        case playlistItems = "/playlistItems"
    }
    
    enum URLBase: String {
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://google.com"
    }
}
