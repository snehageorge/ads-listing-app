# VendAds (ads-listing-app)


### Description of the Solution

This is a SwiftUI-based ads listing app that fetches ads from a remote API and displays them in a clean, responsive layout. It supports both list and grid views via a toggle. Users can mark ads as favorites, which are stored locally using SwiftData and available offline. Users can toggle between "All Ads" and "Favorite Ads" using a segmented control. Images are loaded using the Kingfisher library. The app follows MVVM architecture with protocol-based dependency injection for clean and maintainable code.

### What I am Proud Of

- Followed MVVM and protocol-oriented design to keep the codebase scalable and maintainable.
- Implemented both list and grid views for a flexible UI.
- Stored favorite ads locally for offline access.

### What Could Be Improved

- Show a user-facing message or banner to indicate API errors. Include HTTP status code validation in the API service.
- Add unit tests and UI tests.
- Add a toast message to confirm when an ad has been added to or removed from favorites.
- Sync favorite ads with latest API data. Currently, local favorites are not updated when ads change.
- Refresh all ads data when the app returns to the foreground to avoid showing outdated or empty content.

### What I Could Have Done with More Time

- Add navigation to a detail screen for individual ads.
- Add unit tests and UI tests.
- Add filtering by ad-type.
- Improve UI with better visuals for empty states using illustrations.
- Add response code checks and user-facing error handling.
- Add pull-to-refresh or manual refresh to fetch latest ads.
