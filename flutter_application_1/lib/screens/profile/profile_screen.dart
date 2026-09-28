import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/data/mock_data.dart';
import 'package:flutter_application_1/models/profile_stat.dart';
import 'package:flutter_application_1/providers/cart_provider.dart';
import 'package:flutter_application_1/providers/wishlist_provider.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_menu_tile.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_stat_chip.dart';
import 'package:flutter_application_1/widgets/primary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.onOpenCart,
    required this.onOpenWishlist,
  });

  final VoidCallback onOpenCart;
  final VoidCallback onOpenWishlist;

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartProvider>().itemCount;
    final wishlistCount = context.watch<WishlistProvider>().count;

    final stats = [
      ProfileStat(
        label: 'Cart',
        value: '$cartCount',
        icon: Icons.shopping_cart_outlined,
      ),
      ProfileStat(
        label: 'Wishlist',
        value: '$wishlistCount',
        icon: Icons.favorite_border_rounded,
      ),
      MockData.profileBaseStats[2],
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 28),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 88),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 92,
                        height: 92,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.lightGreenBg,
                            width: 3,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person_outline_rounded,
                            size: 42,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        MockData.profileName,
                        style: AppTextStyles.sectionTitle.copyWith(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        MockData.profilePhone,
                        style: AppTextStyles.subtitle.copyWith(
                          color: Colors.white.withValues(alpha: 0.78),
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: 164,
                        child: PrimaryButton(
                          label: 'Edit Profile',
                          icon: Icons.edit_outlined,
                          filled: false,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white.withValues(alpha: 0.26),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: -46,
                  child: Row(
                    children: [
                      Expanded(
                        child: ProfileStatChip(
                          stat: stats[0],
                          onTap: onOpenCart,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ProfileStatChip(
                          stat: stats[1],
                          onTap: onOpenWishlist,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ProfileStatChip(stat: stats[2]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 66),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
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
                child: Column(
                  children: [
                    ProfileMenuTile(
                      icon: Icons.receipt_long_rounded,
                      title: 'My Orders',
                      subtitle: 'Track & reorder',
                      onTap: () => _openPlaceholder(context, 'My Orders'),
                    ),
                    const Divider(height: 1),
                    ProfileMenuTile(
                      icon: Icons.location_on_outlined,
                      title: 'Saved Addresses',
                      onTap: () =>
                          _openPlaceholder(context, 'Saved Addresses'),
                    ),
                    const Divider(height: 1),
                    ProfileMenuTile(
                      icon: Icons.local_offer_outlined,
                      title: 'Coupons & Offers',
                      onTap: () =>
                          _openPlaceholder(context, 'Coupons & Offers'),
                    ),
                    const Divider(height: 1),
                    ProfileMenuTile(
                      icon: Icons.credit_card_outlined,
                      title: 'Payment Methods',
                      onTap: () =>
                          _openPlaceholder(context, 'Payment Methods'),
                    ),
                    const Divider(height: 1),
                    ProfileMenuTile(
                      icon: Icons.notifications_none_rounded,
                      title: 'Notifications',
                      onTap: () =>
                          _openPlaceholder(context, 'Notifications'),
                    ),
                    const Divider(height: 1),
                    ProfileMenuTile(
                      icon: Icons.help_outline_rounded,
                      title: 'Help & Support',
                      onTap: () =>
                          _openPlaceholder(context, 'Help & Support'),
                    ),
                    const Divider(height: 1),
                    ProfileMenuTile(
                      icon: Icons.shield_outlined,
                      title: 'Privacy & Security',
                      onTap: () =>
                          _openPlaceholder(context, 'Privacy & Security'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                label: 'Log out',
                icon: Icons.logout_rounded,
                filled: false,
                foregroundColor: AppColors.discountRed,
                backgroundColor: AppColors.discountRed.withValues(alpha: 0.26),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'FreshCart \u00B7 v1.0.0',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }

  void _openPlaceholder(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _ComingSoonScreen(title: title),
      ),
    );
  }
}

class _ComingSoonScreen extends StatelessWidget {
  const _ComingSoonScreen({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.hourglass_top_rounded,
                size: 48,
                color: AppColors.primaryGreen,
              ),
              const SizedBox(height: 16),
              Text(
                '$title is coming soon.',
                style: AppTextStyles.sectionTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'This destination is stubbed so the profile menu never dead-ends.',
                style: AppTextStyles.subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
