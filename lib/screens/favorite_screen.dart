import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  // Format price with spaces for thousands
  String formatPrice(String price) {
    return price.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
  }

  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<Map<String, dynamic>> favorites = [
      {
        'id': 1,
        'title': 'iPhone 14 Pro Max 256GB',
        'price': '12500000',
        'oldPrice': '13000000',
        'image': 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-max-gold-select?wid=940&hei=1112&fmt=png-alpha'
      },
      {
        'id': 2,
        'title': 'Samsung Galaxy S23 Ultra',
        'price': '11800000',
        'oldPrice': '12500000',
        'image': 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-max-gold-select?wid=940&hei=1112&fmt=png-alpha'
      },
      {
        'id': 3,
        'title': 'MacBook Pro 14 M2 Pro',
        'price': '18900000',
        'image': 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-max-gold-select?wid=940&hei=1112&fmt=png-alpha'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Избранное',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (favorites.isNotEmpty)
                  Text(
                    '${favorites.length} товаров',
                    style: const TextStyle(
                      color: Color(0xFF62656A),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
              ],
            ),
            expandedHeight: favorites.isEmpty ? 0 : 80,
          ),

          // Content
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: favorites.isEmpty
                ? SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'В избранном пока пусто',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Сохраняйте товары, которые понравились,\nчтобы купить их позже',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => Get.toNamed('/'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7000FF),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Перейти к покупкам',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      childAspectRatio: 0.7,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = favorites[index];
                        return GestureDetector(
                          onTap: () => Get.toNamed('/product/${item['id']}'),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image with favorite button
                                Stack(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                        child: Image.network(
                                          item['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 12,
                                      right: 12,
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(18),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.favorite,
                                            size: 20,
                                            color: Color(0xFF7000FF),
                                          ),
                                          onPressed: () {
                                            // Handle remove from favorites
                                          },
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Product details
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${formatPrice(item['price'])} сум',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                      if (item['oldPrice'] != null) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          '${formatPrice(item['oldPrice'])} сум',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: favorites.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
