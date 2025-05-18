//
//  AdsHomeViewModel.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import Foundation
import SwiftData

@MainActor
class AdsHomeViewModel: ObservableObject {
    @Published var allAds: [AdItem] = []
    @Published var favoriteAds: [AdItem] = []
    @Published var isLoading: Bool = false
    
    private let allAdsAPIService: AdsAPIServiceProtocol
    private let favoriteAdsStorage: FavoriteAdsStorageProtocol
    
    init(allAdsAPIService: AdsAPIServiceProtocol = AdsAPIService(), favoriteAdsStorage: FavoriteAdsStorageProtocol = FavoriteAdsStorage()) {
        self.allAdsAPIService = allAdsAPIService
        self.favoriteAdsStorage = favoriteAdsStorage
    }
    
    func fetchAllAdsFromAPI() async {
        guard !isLoading else { return }
        do {
            isLoading = true
            defer {
                isLoading = false
            }
            let fetchedAds = try await allAdsAPIService.fetchAds()
            self.allAds = fetchedAds
        } catch {
            allAds = []
        }
    }
    
    func loadFavoriteAds(using context: ModelContext) {
        let favoriteAdsFromDb = favoriteAdsStorage.fetchFavoriteAds(
            using: context
        )
        favoriteAds = favoriteAdsFromDb.map { $0.convertToAdItem() }
    }
    
    func isFavorite(_ ad: AdItem, using context: ModelContext) -> Bool {
        return favoriteAdsStorage.isFavorite(ad, using: context)
    }
    
    func toggleFavorite(_ ad: AdItem, using context: ModelContext) {
        if isFavorite(ad, using: context) {
            favoriteAdsStorage.removeFavorite(ad, using: context)
        } else {
            favoriteAdsStorage.addFavorite(ad, using: context)
        }
        loadFavoriteAds(using: context)
    }
}
