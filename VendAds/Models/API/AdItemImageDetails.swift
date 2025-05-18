//
//  AdItemImageDetails.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import Foundation

struct AdItemImageDetails: Decodable {
    let url: String?
    
    var fullImageUrl: URL? {
        url.flatMap { URL(string: APIConstants.baseImageUrlString + $0)}
    }
}
