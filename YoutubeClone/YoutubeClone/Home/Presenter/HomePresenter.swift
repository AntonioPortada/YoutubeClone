//
//  HomePresenter.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 06/11/24.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func getData(list: [[Any]])
}

class HomePresenter {
    
    var provider: HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    private var objectList: [[Any]] = []
    
    init(delegate: HomeViewProtocol, provider: HomeProvider = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func getVideos() async {
        objectList.removeAll()
        
        async let channels = try await provider.getChannel(channelId: Constants.channelId).items
        async let playlist = try await provider.getPlaylist(channelId: Constants.channelId).items
        async let videos = try await provider.getVideo(searchString: "", channelId: Constants.channelId).items
        
        do {
            let (responseChannel, responsePlaylist, responseVideos) = await (try channels, try playlist, try videos)
            objectList.append(responseChannel) // index 1
            if let playlisId = responsePlaylist.first?.id, let playlistItems = await getPlaylistItems(playlistId: playlisId) {
                objectList.append(playlistItems.items) // index 2
            }
            objectList.append(responseVideos) // index 3
            objectList.append(responsePlaylist) // index 4
            
            delegate?.getData(list: objectList)
        } catch {
            print(error)
        }
    }
    
    func getPlaylistItems(playlistId: String) async -> PlaylistItemsModel? {
        do {
            let playListItems = try await provider.getPlaylistItems(playlistId: playlistId)
            return playListItems
        } catch {
            print("error: ", error)
            return nil
        }
    }
}
