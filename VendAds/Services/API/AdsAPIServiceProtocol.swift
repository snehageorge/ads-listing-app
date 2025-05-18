//
//  AdsAPIServiceProtocol.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import Foundation

protocol AdsAPIServiceProtocol {
    func fetchAds() async throws -> [AdItem]
}
