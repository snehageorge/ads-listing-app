//
//  AdListItemRowView.swift
//  VendAds
//
//  Created by Sneha on 18/05/25.
//

import SwiftUI
import Kingfisher

struct AdListItemRowView: View {
    
    let ad: AdItem
    let isFavorite: Bool
    let toggleFavorite: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                if let imageUrl = ad.image?.fullImageUrl {
                    KFImage(imageUrl)
                        .onFailureImage(UIImage(systemName: "photo.fill"))
                        .resizable()
                        .aspectRatio(4/3, contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .cornerRadius(12)
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .cornerRadius(12)
                }
                
                Button(action: toggleFavorite) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(10)
                        .background(Color.white.opacity(0.6))
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .buttonStyle(.plain)
                .padding(8)
            }
            
            if let totalPrice = ad.price?.total {
                Text(totalPrice, format: .currency(code: "SEK"))
                    .font(.subheadline)
                    .fontWeight(.bold)
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
        .padding()
    }
}
