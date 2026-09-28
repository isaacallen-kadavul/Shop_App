import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/providers/cart_provider.dart';
import 'package:flutter_application_1/screens/cart/cart_screen.dart';
import 'package:flutter_application_1/screens/categories/categories_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/screens/wishlist/wishlist_screen.dart';
import 'package:flutter_application_1/widgets/app_bottom_nav.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _currentIndex = 0;

  void _selectTab(int index) {
    if (_currentIndex == index) {
      return;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartProvider>().itemCount;

    final screens = [
      HomeScreen(onOpenCategories: () => _selectTab(1)),
      const CategoriesScreen(),
      WishlistScreen(onStartShopping: () => _selectTab(0)),
      CartScreen(onStartShopping: () => _selectTab(0)),
      ProfileScreen(
        onOpenCart: () => _selectTab(3),
        onOpenWishlist: () => _selectTab(2),
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: _selectTab,
        items: [
          const AppBottomNavItem(icon: Icons.home_rounded, label: 'Home'),
          const AppBottomNavItem(
            icon: Icons.grid_view_rounded,
            label: 'Categories',
          ),
          const AppBottomNavItem(
            icon: Icons.favorite_border_rounded,
            label: 'Wishlist',
          ),
          AppBottomNavItem(
            icon: Icons.shopping_cart_outlined,
            label: 'Cart',
            badgeCount: cartCount,
          ),
          const AppBottomNavItem(
            icon: Icons.person_outline_rounded,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
