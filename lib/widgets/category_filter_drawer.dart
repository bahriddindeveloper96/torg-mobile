import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CategoryFilterDrawer extends StatefulWidget {
  final Map<String, String> filters;
  final Function() onClose;
  final Function(Map<String, String>) onApply;

  const CategoryFilterDrawer({
    super.key,
    required this.filters,
    required this.onClose,
    required this.onApply,
  });

  @override
  State<CategoryFilterDrawer> createState() => _CategoryFilterDrawerState();
}

class _CategoryFilterDrawerState extends State<CategoryFilterDrawer> {
  late final Map<String, String> _tempFilters;

  @override
  void initState() {
    super.initState();
    _tempFilters = Map.from(widget.filters);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Backdrop
        GestureDetector(
          onTap: widget.onClose,
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        // Drawer
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filtrlar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: widget.onClose,
                        icon: const Icon(Icons.close),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                // Filter Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Price Range
                        _buildFilterSection(
                          'Narx oralig\'i',
                          Column(
                            children: [
                              _buildTextField(
                                'Dan',
                                'priceFrom',
                                TextInputType.number,
                              ),
                              const SizedBox(height: 8),
                              _buildTextField(
                                'Gacha',
                                'priceTo',
                                TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Brand
                        _buildFilterSection(
                          'Brend',
                          _buildTextField(
                            'Brendni kiriting',
                            'brand',
                            TextInputType.text,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Year Range
                        _buildFilterSection(
                          'Yil oralig\'i',
                          Column(
                            children: [
                              _buildTextField(
                                'Dan',
                                'yearFrom',
                                TextInputType.number,
                              ),
                              const SizedBox(height: 8),
                              _buildTextField(
                                'Gacha',
                                'yearTo',
                                TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Apply Button
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () => widget.onApply(_tempFilters),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Qo\'llash',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        content,
      ],
    );
  }

  Widget _buildTextField(
    String hint,
    String field,
    TextInputType keyboardType,
  ) {
    return TextField(
      controller: TextEditingController(text: _tempFilters[field]),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      onChanged: (value) => _tempFilters[field] = value,
    );
  }
}
