//
//  PlaylistItemModel.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 03/11/24.
//

import Foundation


struct PlaylistItemsModel: Decodable{
    let kind: String
    let etag: String
    let items: [PlaylistItems]
    let pageInfo : PageInfo
    
    struct PlaylistItems: Decodable{
        let kind : String
        let etag : String
        let id : String
        let snippet : VideoModel.Item.Snippet
    }
    
    struct PageInfo: Decodable{
        let totalResults: Int
        let resultsPerPage: Int
    }
}
