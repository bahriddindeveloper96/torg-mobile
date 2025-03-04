import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Favorites',
            style: TextStyle(
              color: Color(0xFF002F34),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE5E9EB),
                    width: 1,
                  ),
                ),
              ),
              child: TabBar(
                labelColor: const Color(0xFF002F34),
                unselectedLabelColor: const Color(0xFF406367),
                indicatorColor: const Color(0xFF002F34),
                indicatorWeight: 2,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: 'Ads'),
                  Tab(text: 'Searches'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildFavoriteAds(),
            _buildFavoriteSearches(),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteAds() {
    // Temporary sample data
    final List<Map<String, dynamic>> favoriteAds = [
      {
        'title': 'iPhone 13 Pro Max',
        'price': '12,000,000',
        'location': 'Tashkent',
        'date': '2 days ago',
        'image': 'https://picsum.photos/200/300',
      },
      {
        'title': 'Samsung Galaxy S21',
        'price': '8,000,000',
        'location': 'Samarkand',
        'date': '1 week ago',
        'image': 'https://picsum.photos/200/301',
      },
      {
        'title': 'MacBook Pro M1',
        'price': '15,000,000',
        'location': 'Bukhara',
        'date': '3 days ago',
        'image': 'https://picsum.photos/200/302',
      },
    ];

    if (favoriteAds.isEmpty) {
      return _buildEmptyState(
        icon: Icons.favorite_border,
        title: 'No favorite ads yet',
        subtitle: 'Add items to favorites to see them here',
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: favoriteAds.length,
      itemBuilder: (context, index) {
        // final ad = favoriteAds[index];
        // // return ProductCard(
        // //   title: ad['title'],
        // //   price: ad['price'],
        // //   location: ad['location'],
        // //   date: ad['date'],
        // //   imageUrl: ad['image'],
        // //   onTap: () {
        // //     // TODO: Navigate to product detail
        // //   },
        // //   onFavorite: () {
        // //     // TODO: Remove from favorites
        // //   },
        // );
      },
    );
  }

  Widget _buildFavoriteSearches() {
    // Temporary sample data
    final List<Map<String, dynamic>> savedSearches = [
      {
        'query': 'iPhone 13',
        'filters': 'Tashkent, 8-12M UZS',
        'date': '2 days ago',
      },
      {
        'query': 'MacBook Pro',
        'filters': 'All regions, 15-20M UZS',
        'date': '1 week ago',
      },
    ];

    if (savedSearches.isEmpty) {
      return _buildEmptyState(
        icon: Icons.search_off_outlined,
        title: 'No saved searches',
        subtitle: 'Save your searches to get notified about new items',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: savedSearches.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final search = savedSearches[index];
        return _buildSearchCard(
          query: search['query'],
          filters: search['filters'],
          date: search['date'],
        );
      },
    );
  }

  Widget _buildSearchCard({
    required String query,
    required String filters,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE5E9EB),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Execute saved search
          },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        query,
                        style: const TextStyle(
                          color: Color(0xFF002F34),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        filters,
                        style: const TextStyle(
                          color: Color(0xFF406367),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Color(0xFF406367),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: Remove saved search
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF406367),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 64,
              color: const Color(0xFF406367),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF002F34),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF406367),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
