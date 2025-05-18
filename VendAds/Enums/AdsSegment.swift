//
//  AdsSegment.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import Foundation

enum AdsSegment: Int, CaseIterable, Identifiable {
    case all = 0
    case favorites = 1
    
    var id: Int {
        self.rawValue
    }
    
    var title: String {
        switch self {
            case .all:
                return "All"
            case .favorites:
                return "Favorites"
        }
    }
}
