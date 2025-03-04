import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../widgets/home_category_card.dart';
import '../../widgets/product_card.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/olx_logo.dart';
import '../product_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const OlxLogo(height: 28),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.favorite_border, color: AppColors.primary),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.person_outline, color: AppColors.primary),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSearchBar(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: HomeCategoryCard(
                      icon: _getCategoryIcon(index),
                      title: _getCategoryTitle(index),
                      color: _getCategoryColor(index),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.62, // Taller cards
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final List<Map<String, dynamic>> products = [
                    {
                      'id': 1,
                      'image': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=500',
                      'title': 'iPhone 14 Pro Max - 256GB',
                      'price': '\$1,199',
                      'location': 'Tashkent, Chilonzor',
                      'date': '1 hour ago',
                      'isFavorite': false,
                      'category': 'Mobile',
                    },
                    {
                      'id': 2,
                      'image': 'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?q=80&w=500',
                      'title': 'Samsung Galaxy S23 Ultra',
                      'price': '\$1,099',
                      'location': 'Tashkent, Yunusobod',
                      'date': '2 hours ago',
                      'isFavorite': false,
                      'category': 'Mobile',
                    },
                    {
                      'id': 3,
                      'image': 'https://images.unsplash.com/photo-1585399000684-d2f72660f092?q=80&w=500',
                      'title': 'MacBook Pro M1 - 512GB',
                      'price': '\$1,499',
                      'location': 'Tashkent, Mirabad',
                      'date': '3 hours ago',
                      'isFavorite': false,
                      'category': 'Laptop',
                    },
                    {
                      'id': 4,
                      'image': 'https://images.unsplash.com/photo-1505156868547-9b49f4df4e04?q=80&w=500',
                      'title': 'Apple Watch Series 8',
                      'price': '\$399',
                      'location': 'Tashkent, Mirzo Ulugbek',
                      'date': '5 hours ago',
                      'isFavorite': false,
                      'category': 'Watch',
                    },
                    {
                      'id': 5,
                      'image': 'https://images.unsplash.com/photo-1600003263720-95b45a4035d5?q=80&w=500',
                      'title': 'Sony PlayStation 5',
                      'price': '\$499',
                      'location': 'Tashkent, Shayxontohur',
                      'date': '1 day ago',
                      'isFavorite': false,
                      'category': 'Gaming',
                    },
                    {
                      'id': 6,
                      'image': 'https://images.unsplash.com/photo-1507764923504-cd90bf7da772?q=80&w=500',
                      'title': 'Samsung 65" QLED TV',
                      'price': '\$999',
                      'location': 'Tashkent, Yashnobod',
                      'date': '2 days ago',
                      'isFavorite': false,
                      'category': 'TV',
                    },
                  ];

                  return ProductCard(
                    product: products[index % products.length],
                    onToggleFavorite: (id) {},
                    onTap: () {
                      final product = products[index % products.length];
                      // Add sample images for the product view
                      final productWithImages = {
                        ...product,
                        'images': [
                          product['image'],
                          'https://images.unsplash.com/photo-1591337676887-a217a6970a8a?q=80&w=500',
                          'https://images.unsplash.com/photo-1580910051074-3eb694886505?q=80&w=500',
                        ],
                        'seller': {
                          'name': 'John Doe',
                          'rating': 4.8,
                          'phone': '+998 90 123 45 67',
                        },
                        'description': 'This is a high-quality product in excellent condition. The device has been well maintained and comes with all original accessories. Perfect for those looking for a reliable and stylish device.',
                      };
                      Get.to(
                        () => ProductView(product: productWithImages),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                  );
                },
                childCount: 6,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(int index) {
    final List<IconData> icons = [
      Icons.phone_android,
      Icons.laptop,
      Icons.car_rental,
      Icons.house,
      Icons.chair,
      Icons.tv,
      Icons.sports_football,
      Icons.pets,
      Icons.watch,
      Icons.more_horiz,
    ];
    return icons[index % icons.length];
  }

  String _getCategoryTitle(int index) {
    final List<String> titles = [
      'Mobile',
      'Laptop',
      'Vehicles',
      'Property',
      'Furniture',
      'Electronics',
      'Sports',
      'Pets',
      'Watches',
      'More',
    ];
    return titles[index % titles.length];
  }

  Color _getCategoryColor(int index) {
    final List<Color> colors = [
      AppColors.primary,
      AppColors.secondary,
      Colors.orange,
      Colors.green,
      Colors.purple,
      Colors.blue,
      Colors.red,
      Colors.brown,
      Colors.teal,
      Colors.grey,
    ];
    return colors[index % colors.length];
  }
}
