import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/providers/cart_provider.dart';
import 'package:flutter_application_1/widgets/common_empty_state.dart';
import 'package:flutter_application_1/widgets/primary_button.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key, required this.onStartShopping});

  final VoidCallback onStartShopping;
  final NumberFormat _currency = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '\u20B9',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final items = cartProvider.items;

          if (items.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  child: Text('Your Cart', style: AppTextStyles.screenTitle),
                ),
                Expanded(
                  child: CommonEmptyState(
                    icon: Icons.shopping_cart_outlined,
                    title: "Your cart's feeling a little light \u{1F955}",
                    subtitle:
                        'Add fresh produce, snacks, and essentials to get started.',
                    buttonLabel: 'Start shopping',
                    onPressed: onStartShopping,
                  ),
                ),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Cart', style: AppTextStyles.screenTitle),
                    const SizedBox(height: 6),
                    Text(
                      '${cartProvider.itemCount} items ready to deliver',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: items.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 14,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: item.product.imageUrl,
                              width: 74,
                              height: 74,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Container(color: const Color(0xFFF2F2F2)),
                              errorWidget: (context, url, error) => Container(
                                color: const Color(0xFFF2F2F2),
                                child: const Icon(Icons.image_outlined),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.product.name,
                                  style: AppTextStyles.body.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.product.weight,
                                  style: AppTextStyles.caption,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _currency.format(item.product.price),
                                  style: AppTextStyles.price,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () => context
                                    .read<CartProvider>()
                                    .removeProduct(item.product.id),
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: AppColors.textSecondary,
                                ),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(999),
                                  color: const Color(0xFFF7F7F7),
                                ),
                                child: Row(
                                  children: [
                                    _StepperButton(
                                      icon: Icons.remove_rounded,
                                      onTap: () => context
                                          .read<CartProvider>()
                                          .decrementQuantity(item.product.id),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Text(
                                        item.quantity.toString(),
                                        style: AppTextStyles.body.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    _StepperButton(
                                      icon: Icons.add_rounded,
                                      onTap: () => context
                                          .read<CartProvider>()
                                          .incrementQuantity(item.product.id),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 18,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Subtotal', style: AppTextStyles.caption),
                            const SizedBox(height: 4),
                            Text(
                              _currency.format(cartProvider.subtotal),
                              style: AppTextStyles.screenTitle.copyWith(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'Delivery free',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(label: 'Checkout', onPressed: () {}),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 28,
          height: 28,
          child: Icon(icon, size: 18, color: AppColors.primaryGreen),
        ),
      ),
    );
  }
}
