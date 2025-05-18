//
//  AdGridItemView.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import SwiftUI
import Kingfisher

struct AdGridItemView: View {
    let ad: AdItem
    let isFavorite: Bool
    let toggleFavorite: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack(alignment: .topTrailing) {
                if let imageUrl = ad.image?.fullImageUrl {
                    KFImage(imageUrl)
                        .onFailureImage(UIImage(systemName: "photo.fill"))
                        .resizable()
                        .aspectRatio(4/3, contentMode: .fill)
                        .frame(height: 120)
                        .clipped()
                        .padding(0)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .aspectRatio(4/3, contentMode: .fill)
                        .frame(height: 120)
                        .clipped()
                        .padding(0)
                        .cornerRadius(10)
                }
                
                Button(action: toggleFavorite) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(6)
                        .background(Color.black.opacity(0.6))
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .buttonStyle(.plain)
                .padding(6)
            }
            
            if let totalPrice = ad.price?.total {
                Text(totalPrice, format: .currency(code: "SEK"))
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            if let location = ad.location {
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                    Text(location)
                        .font(.caption)
                        .foregroundStyle(.primary)
                        .lineLimit(1)
                }
            }
            
            if let title = ad.adDescription {
                Text(title)
                    .font(.caption)
                    .lineLimit(2)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
