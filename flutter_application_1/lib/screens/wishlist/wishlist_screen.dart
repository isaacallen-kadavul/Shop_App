import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/providers/wishlist_provider.dart';
import 'package:flutter_application_1/screens/home/widgets/product_grid_card.dart';
import 'package:flutter_application_1/widgets/common_empty_state.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key, required this.onStartShopping});

  final VoidCallback onStartShopping;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<WishlistProvider>(
        builder: (context, wishlistProvider, child) {
          final items = wishlistProvider.items;

          if (items.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Wishlist', style: AppTextStyles.screenTitle),
                      const SizedBox(height: 6),
                      Text('0 saved items', style: AppTextStyles.subtitle),
                    ],
                  ),
                ),
                Expanded(
                  child: CommonEmptyState(
                    icon: Icons.favorite_border_rounded,
                    title: 'Nothing saved yet',
                    subtitle:
                        'Tap the heart on any product to add it to your wishlist.',
                    buttonLabel: 'Start shopping',
                    onPressed: onStartShopping,
                  ),
                ),
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Wishlist', style: AppTextStyles.screenTitle),
                const SizedBox(height: 6),
                Text(
                  '${items.length} saved items',
                  style: AppTextStyles.subtitle,
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(bottom: 24),
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.62,
                        ),
                    itemBuilder: (context, index) {
                      return ProductGridCard(product: items[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
