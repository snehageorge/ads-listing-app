//
//  AdsHomeView.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import SwiftUI
import SwiftData

struct AdsHomeView: View {
    
    @StateObject private var adsHomeViewModel = AdsHomeViewModel()
    @Environment(\.modelContext) private var modelContext
    // Store the user's layout preference (grid/list) across app launches
    @AppStorage("isGridView") private var isGridView = true
    @State private var selectedAdsSegment: AdsSegment = .all
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack {
                    if adsHomeViewModel.isLoading {
                        ProgressView()
                            .foregroundStyle(.primary)
                    } else {
                        Picker(
                            Strings.Ads.showAdsTitle,
                            selection: $selectedAdsSegment
                        ) {
                            ForEach(AdsSegment.allCases) { segment in
                                Text(segment.title).tag(segment)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        
                        if selectedAdsSegment == .all  && adsHomeViewModel.allAds.isEmpty {
                            Text(Strings.Ads.noAdsMessage)
                                .frame(maxHeight: .infinity, alignment: .center)
                                .multilineTextAlignment(.center)
                                .font(.body)
                                .foregroundColor(.secondary)
                        } else if selectedAdsSegment == .favorites && adsHomeViewModel.favoriteAds.isEmpty {
                            Text(Strings.Ads.noFavoritesMessage)
                                .frame(maxHeight: .infinity, alignment: .center)
                                .multilineTextAlignment(.center)
                                .font(.body)
                                .foregroundColor(.secondary)
                        } else {
                            switch selectedAdsSegment {
                                case .all:
                                    AllAdItemsView(
                                        ads: adsHomeViewModel.allAds,
                                        isGridView: isGridView,
                                        isFavorite: {
                                            adsHomeViewModel.isFavorite($0, using: modelContext)
                                        },
                                        toggleFavorite: {
                                            adsHomeViewModel.toggleFavorite($0, using: modelContext)
                                        }
                                    )
                                case .favorites:
                                    FavoriteAdItemsView(
                                        ads: adsHomeViewModel.favoriteAds,
                                        isGridView: isGridView,
                                        isFavorite: {
                                            adsHomeViewModel.isFavorite($0, using: modelContext)
                                        },
                                        toggleFavorite: {
                                            adsHomeViewModel.toggleFavorite($0, using: modelContext)
                                        }
                                    )
                            }
                        }
                    }
                }
            }
            .navigationTitle(Strings.Ads.adsTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isGridView.toggle()
                        }
                    }) {
                        Image(systemName: isGridView ? "list.bullet" : "square.grid.2x2")
                            .foregroundStyle(Color.primary)
                    }
                }
            }
        }
        .task {
            await adsHomeViewModel.fetchAllAdsFromAPI()
            adsHomeViewModel.loadFavoriteAds(using: modelContext)
        }
    }
}

#Preview {
    AdsHomeView()
}
