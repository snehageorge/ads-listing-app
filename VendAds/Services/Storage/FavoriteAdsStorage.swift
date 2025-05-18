//
//  FavoriteAdsStorage.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import Foundation
import SwiftData

class FavoriteAdsStorage: FavoriteAdsStorageProtocol {
    
    func fetchFavoriteAds(using context: ModelContext) -> [FavoriteAdItem] {
        let fetchRequest = FetchDescriptor<FavoriteAdItem>()
        let favoriteAds = (try? context.fetch(fetchRequest)) ?? []
        return favoriteAds
    }
    
    func addFavorite(_ ad: AdItem, using context: ModelContext) {
        let favoriteAd = FavoriteAdItem(
            id: ad.id,
            adDescription: ad.adDescription,
            adType: ad.adType,
            location: ad.location,
            priceTotal: ad.price?.total,
            imageUrlString: ad.image?.url
        )
        context.insert(favoriteAd)
        try? context.save()
    }
    
    func removeFavorite(_ ad: AdItem, using context: ModelContext) {
        if let favoriteAdToDelete = fetchFavoriteAd(
            withId: ad.id,
            using: context
        ) {
            context.delete(favoriteAdToDelete)
        }
        try? context.save()
    }
    
    func isFavorite(_ ad: AdItem, using context: ModelContext) -> Bool {
        fetchFavoriteAd(withId: ad.id, using: context) != nil
    }
    
    private func fetchFavoriteAd(withId id: String, using context: ModelContext) -> FavoriteAdItem? {
        let fetchRequest = FetchDescriptor<FavoriteAdItem>(
            predicate: #Predicate { $0.id == id }
        )
        return try? context.fetch(fetchRequest).first
    }
}

