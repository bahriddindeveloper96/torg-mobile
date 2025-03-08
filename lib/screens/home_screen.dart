import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../widgets/home_category_card.dart';
import '../widgets/product_card.dart';
import '../widgets/header.dart';
import './product_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Header(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 24),
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
                childAspectRatio: 0.62,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = _products[index];
                  return ProductCard(
                    product: product,
                    onToggleFavorite: (id) {
                      // Handle favorite toggle
                    },
                    onTap: () => Get.to(
                      () => ProductView(product: product),
                      transition: Transition.rightToLeft,
                    ),
                  );
                },
                childCount: _products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(int index) {
    final List<IconData> icons = [
      Icons.phone_android,
      Icons.car_rental,
      Icons.house,
      Icons.laptop,
      Icons.chair,
      Icons.pets,
      Icons.sports_soccer,
      Icons.work,
      Icons.shopping_bag,
      Icons.more_horiz,
    ];
    return icons[index % icons.length];
  }

  String _getCategoryTitle(int index) {
    final List<String> titles = [
      'Mobile',
      'Vehicles',
      'Property',
      'Electronics',
      'Furniture',
      'Pets',
      'Sports',
      'Jobs',
      'Fashion',
      'More',
    ];
    return titles[index % titles.length];
  }

  Color _getCategoryColor(int index) {
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.amber,
      Colors.grey,
    ];
    return colors[index % colors.length];
  }
}

final List<Map<String, dynamic>> _products = [
  {
    'id': 1,
    'image':
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=500',
    'title': 'iPhone 14 Pro Max - 256GB',
    'price': '\$1,199',
    'location': 'Tashkent, Chilonzor',
    'date': '1 hour ago',
    'isFavorite': false,
    'category': 'Mobile',
  },
  {
    'id': 2,
    'image':
        'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?q=80&w=500',
    'title': 'Samsung Galaxy S23 Ultra',
    'price': '\$1,099',
    'location': 'Tashkent, Yunusobod',
    'date': '2 hours ago',
    'isFavorite': false,
    'category': 'Mobile',
  },
  {
    'id': 3,
    'image':
        'https://images.unsplash.com/photo-1585399000684-d2f72660f092?q=80&w=500',
    'title': 'MacBook Pro M1 - 512GB',
    'price': '\$1,499',
    'location': 'Tashkent, Mirabad',
    'date': '3 hours ago',
    'isFavorite': false,
    'category': 'Laptop',
  },
  {
    'id': 4,
    'image':
        'https://images.unsplash.com/photo-1505156868547-9b49f4df4e04?q=80&w=500',
    'title': 'Apple Watch Series 8',
    'price': '\$399',
    'location': 'Tashkent, Mirzo Ulugbek',
    'date': '5 hours ago',
    'isFavorite': false,
    'category': 'Watch',
  },
  {
    'id': 5,
    'image':
        'https://images.unsplash.com/photo-1600003263720-95b45a4035d5?q=80&w=500',
    'title': 'Sony PlayStation 5',
    'price': '\$499',
    'location': 'Tashkent, Shayxontohur',
    'date': '1 day ago',
    'isFavorite': false,
    'category': 'Gaming',
  },
  {
    'id': 6,
    'image':
        'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?q=80&w=500',
    'title': 'Dell XPS 15 - 1TB',
    'price': '\$1,799',
    'location': 'Tashkent, Sergeli',
    'date': '2 days ago',
    'isFavorite': false,
    'category': 'Laptop',
  },
];
