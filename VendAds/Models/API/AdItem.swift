//
//  AdItem.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import Foundation

struct AdItem: Identifiable, Decodable {

    let id: String
    let adDescription: String?
    let adType: String
    let location: String?
    let price: AdItemPrice?
    let image: AdItemImageDetails?
    
    enum CodingKeys: String, CodingKey {
        case id
        case adDescription = "description"
        case adType = "ad-type"
        case location
        case price
        case image
    }
}
