//
//  AdsAPIService.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import Foundation

class AdsAPIService: AdsAPIServiceProtocol {
    
    func fetchAds() async throws -> [AdItem] {
        guard let url = URL(string: APIConstants.allAdsUrlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        // Ignore cache to prevent displaying outdated data when offline
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResult = try JSONDecoder().decode(
            AdsListAPIResponse.self,
            from: data
        )
        return decodedResult.items
    }
}
