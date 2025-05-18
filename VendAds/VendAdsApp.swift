//
//  VendAdsApp.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import SwiftUI

@main
struct VendAdsApp: App {
    var body: some Scene {
        WindowGroup {
            AdsHomeView()
        }
        .modelContainer(for: FavoriteAdItem.self)
    }
}
