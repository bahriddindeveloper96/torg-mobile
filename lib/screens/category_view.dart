import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../widgets/category_filter_drawer.dart';
import '../widgets/product_card.dart';
import '../screens/product_view.dart';
import '../widgets/bottom_navigation.dart';
import '../controllers/navigation_controller.dart';

class CategoryView extends StatefulWidget {
  final String category;

  const CategoryView({
    super.key,
    required this.category,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final _showFilters = false.obs;
  final _filters = {
    'priceFrom': '',
    'priceTo': '',
    'brand': '',
    'yearFrom': '',
    'yearTo': ''
  }.obs;

  final NavigationController navigationController =
      Get.find<NavigationController>();

  // Sample products data
  final List<Map<String, dynamic>> _products = [
    {
      'id': 1,
      'image':
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=500',
      'title': 'iPhone 14 Pro Max - 256GB, Blue Color, Perfect Condition',
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
      'title':
          'Samsung Galaxy S23 Ultra - 512GB, Black, Full Box with Warranty',
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
      'title': 'MacBook Pro M1 - 512GB SSD, 16GB RAM, Space Gray',
      'price': '\$1,499',
      'location': 'Tashkent, Mirabad',
      'date': '3 hours ago',
      'isFavorite': false,
      'category': 'Laptop',
    },
    {
      'id': 5,
      'image':
          'https://images.unsplash.com/photo-1585399000684-d2f72660f092?q=80&w=500',
      'title': 'MacBook Pro M1 - 512GB SSD, 16GB RAM, Space Gray',
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
      'title': 'Apple Watch Series 8 - GPS + Cellular, 45mm',
      'price': '\$399',
      'location': 'Tashkent, Mirzo Ulugbek',
      'date': '5 hours ago',
      'isFavorite': false,
      'category': 'Watch',
    },
    {
      'id': 6,
      'image':
          'https://images.unsplash.com/photo-1505156868547-9b49f4df4e04?q=80&w=500',
      'title': 'Apple Watch Series 8 - GPS + Cellular, 45mm',
      'price': '\$399',
      'location': 'Tashkent, Mirzo Ulugbek',
      'date': '5 hours ago',
      'isFavorite': false,
      'category': 'Watch',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // Custom App Bar
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                pinned: true,
                expandedHeight: 160,
                collapsedHeight: 70,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Breadcrumbs
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Text(
                                  'Bosh sahifa',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 16,
                                color: Colors.grey[400],
                              ),
                              Text(
                                widget.category,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Category Title and Count
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.category,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '${_products.length} e\'lonlar',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Filter Button
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () => _showFilters.value = true,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.tune_rounded,
                                          color: Colors.grey[800],
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Filter',
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Products Grid
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.62,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = _products[index];
                      return ProductCard(
                        product: product,
                        onToggleFavorite: (id) {
                          setState(() {
                            product['isFavorite'] = !product['isFavorite'];
                          });
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
              // Add padding at bottom for navigation bar
              const SliverPadding(
                padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
              ),
            ],
          ),

          // Filter Drawer
          Obx(() => _showFilters.value
              ? CategoryFilterDrawer(
                  filters: _filters,
                  onClose: () => _showFilters.value = false,
                  onApply: (newFilters) {
                    _filters.value = newFilters;
                    _showFilters.value = false;
                  },
                )
              : const SizedBox()),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        controller: navigationController,
      ),
    );
  }
}
