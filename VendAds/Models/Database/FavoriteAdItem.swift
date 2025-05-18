//
//  FavoriteAdItem.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import Foundation
import SwiftData

@Model
final class FavoriteAdItem: Identifiable {
    var id: String
    var adDescription: String?
    var adType: String
    var location: String?
    var priceTotal: Decimal?
    var imageUrlString: String?
    
    init(
        id: String,
        adDescription: String?,
        adType: String,
        location: String?,
        priceTotal: Decimal?,
        imageUrlString: String?
    ) {
        self.id = id
        self.adDescription = adDescription
        self.adType = adType
        self.location = location
        self.priceTotal = priceTotal
        self.imageUrlString = imageUrlString
    }
}

extension FavoriteAdItem {
    func convertToAdItem() -> AdItem {
        AdItem(
            id: self.id,
            adDescription: self.adDescription,
            adType: self.adType,
            location: self.location,
            price: AdItemPrice(total: self.priceTotal),
            image: AdItemImageDetails(url: self.imageUrlString)
        )
    }
}
