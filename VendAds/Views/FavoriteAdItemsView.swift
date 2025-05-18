//
//  FavoriteAdItemsView.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import SwiftUI

// NOTE: AllAdItemsView and FavoriteAdItemsView currently share similar layout logic,
// but are kept seperate to support potential future differences in UI, behavior, or filtering.
struct FavoriteAdItemsView: View {
    
    let ads: [AdItem]
    let isGridView: Bool
    let isFavorite: (AdItem) -> Bool
    let toggleFavorite: (AdItem) -> Void
    
    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        Group {
            if isGridView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(ads) { ad in
                            AdGridItemView(
                                ad: ad,
                                isFavorite: isFavorite(ad),
                                toggleFavorite: {
                                    toggleFavorite(ad)
                                }
                            )
                        }
                        .background(Color(.systemGroupedBackground))
                    }
                    .padding()
                }
            } else {
                List(ads) { ad in
                    AdListItemRowView(
                        ad: ad,
                        isFavorite: isFavorite(ad),
                        toggleFavorite: {
                            toggleFavorite(ad)
                        }
                    )
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(.systemGroupedBackground))
                }
                .listRowSpacing(15)
                .listStyle(.plain)
                .background(Color(.systemGroupedBackground))
            }
        }
    }
}
