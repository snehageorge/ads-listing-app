//
//  FavoriteAdsStorageProtocol.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import SwiftData

protocol FavoriteAdsStorageProtocol {
    func fetchFavoriteAds(using context: ModelContext) -> [FavoriteAdItem]
    func addFavorite(_ ad: AdItem, using context: ModelContext)
    func removeFavorite(_ ad: AdItem, using context: ModelContext)
    func isFavorite(_ ad: AdItem, using context: ModelContext) -> Bool
}
