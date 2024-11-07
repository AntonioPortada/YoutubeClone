//
//  HomeProvider.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 06/11/24.
//

import Foundation

class HomeProvider {
    
    func getVideo(searchString: String, channelId: String) async throws -> VideoModel {
        var queryParams: [String : String] = ["part":"snipet"] //para validar url
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
}
