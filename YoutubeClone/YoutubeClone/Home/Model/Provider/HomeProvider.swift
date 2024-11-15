//
//  HomeProvider.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 06/11/24.
//

import Foundation

protocol HomeProviderProtocol {
    func getVideo(searchString: String, channelId: String) async throws -> VideoModel
    func getChannel(channelId: String) async throws -> ChannelModel
    func getPlaylist(channelId: String) async throws -> PlaylistModel
    func getPlaylistItems(playlistId: String) async throws -> PlaylistItemsModel
}

class HomeProvider: HomeProviderProtocol {
    
    func getVideo(searchString: String, channelId: String) async throws -> VideoModel {
        var queryParams: [String : String] = [
            "part" : "snippet",
            "type" : "video"
        ]
        if !channelId.isEmpty {
            queryParams["channelId"] = searchString
        }
        if !searchString.isEmpty {
            queryParams["q"] = searchString
        }
        let requesModel = RequestModel(endpoint: .search, queryItems: queryParams)
        do {
            let model = try await ServiceLayer.callService(requesModel, VideoModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
    func getChannel(channelId: String) async throws -> ChannelModel {
        let queryParams: [String : String] = [
            "part" : "snippet,statistics,brandingSettings",
            "id" : channelId
        ]
        let requesModel = RequestModel(endpoint: .channels, queryItems: queryParams)
        do {
            let model = try await ServiceLayer.callService(requesModel, ChannelModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
    func getPlaylist(channelId: String) async throws -> PlaylistModel {
        let queryParams: [String : String] = [
            "part" : "snippet,contentDetails",
            "channelId" : channelId
        ]
        let requesModel = RequestModel(endpoint: .playlists, queryItems: queryParams)
        do {
            let model = try await ServiceLayer.callService(requesModel, PlaylistModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
    func getPlaylistItems(playlistId: String) async throws -> PlaylistItemsModel {
        let queryParams: [String : String] = [
            "part" : "snippet,id,contentDetails",
            "playlistId" : playlistId
        ]
        let requesModel = RequestModel(endpoint: .playlistItems, queryItems: queryParams)
        do {
            let model = try await ServiceLayer.callService(requesModel, PlaylistItemsModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
}
