import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/models/banner_item.dart';
import 'package:flutter_application_1/models/category_item.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/profile_stat.dart';

class MockData {
  static const String profileName = 'FreshCart User';
  static const String profilePhone = '+91 3653655255';

  static const List<BannerItem> banners = [
    BannerItem(
      id: 'banner_breakfast',
      title: 'Breakfast Essentials',
      subtitle: 'Milk, bread & eggs delivered fast',
      imageUrl:
          'https://images.unsplash.com/photo-1550583724-b2692b85b150?auto=format&fit=crop&w=1200&q=80',
      ctaLabel: 'Order Now',
    ),
  ];

  static const List<CategoryItem> quickCategories = [
    CategoryItem(
      id: 'vegetables',
      name: 'Vegetables',
      imageUrl:
          'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catVegetables,
    ),
    CategoryItem(
      id: 'fruits',
      name: 'Fruits',
      imageUrl:
          'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catFruits,
    ),
    CategoryItem(
      id: 'dairy_eggs',
      name: 'Dairy & Eggs',
      imageUrl:
          'https://images.unsplash.com/photo-1506617564039-2f3b650b7010?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catDairyEggs,
    ),
    CategoryItem(
      id: 'bakery',
      name: 'Bakery',
      imageUrl:
          'https://images.unsplash.com/photo-1517433670267-08bbd4be890f?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catBakery,
    ),
    CategoryItem(
      id: 'snacks',
      name: 'Snacks',
      imageUrl:
          'https://images.unsplash.com/photo-1599490659213-e2b9527bd087?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catSnacks,
    ),
  ];

  static const List<CategoryItem> allCategories = [
    CategoryItem(
      id: 'vegetables',
      name: 'Vegetables',
      imageUrl:
          'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catVegetables,
    ),
    CategoryItem(
      id: 'fruits',
      name: 'Fruits',
      imageUrl:
          'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catFruits,
    ),
    CategoryItem(
      id: 'dairy_eggs',
      name: 'Dairy & Eggs',
      imageUrl:
          'https://images.unsplash.com/photo-1506617564039-2f3b650b7010?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catDairyEggs,
    ),
    CategoryItem(
      id: 'bakery',
      name: 'Bakery',
      imageUrl:
          'https://images.unsplash.com/photo-1517433670267-08bbd4be890f?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catBakery,
    ),
    CategoryItem(
      id: 'snacks',
      name: 'Snacks',
      imageUrl:
          'https://images.unsplash.com/photo-1599490659213-e2b9527bd087?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catSnacks,
    ),
    CategoryItem(
      id: 'beverages',
      name: 'Beverages',
      imageUrl:
          'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catBeverages,
    ),
    CategoryItem(
      id: 'grocery',
      name: 'Grocery',
      imageUrl:
          'https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catGrocery,
    ),
    CategoryItem(
      id: 'frozen',
      name: 'Frozen',
      imageUrl:
          'https://images.unsplash.com/photo-1584263347416-85a696b4eda7?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catFrozen,
    ),
    CategoryItem(
      id: 'personal_care',
      name: 'Personal Care',
      imageUrl:
          'https://images.unsplash.com/photo-1556228578-8c89e6adf883?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catPersonalCare,
    ),
    CategoryItem(
      id: 'household',
      name: 'Household',
      imageUrl:
          'https://images.unsplash.com/photo-1583947582886-f40ec95dd752?auto=format&fit=crop&w=600&q=80',
      bgColor: AppColors.catHousehold,
    ),
  ];

  static const List<ProductItem> flashSaleProducts = [
    ProductItem(
      id: 'alphonso_mangoes',
      name: 'Alphonso Mangoes',
      imageUrl:
          'https://images.unsplash.com/photo-1553279768-865429fa0078?auto=format&fit=crop&w=800&q=80',
      weight: '1kg',
      price: 249,
      originalPrice: 349,
      discountPercent: 29,
    ),
    ProductItem(
      id: 'fresh_strawberries',
      name: 'Fresh Strawberries',
      imageUrl:
          'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=800&q=80',
      weight: '250g',
      price: 129,
      originalPrice: 179,
      discountPercent: 28,
    ),
  ];

  static const List<ProductItem> freshVegetablesProducts = [
    ProductItem(
      id: 'tomatoes',
      name: 'Tomatoes',
      imageUrl:
          'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=800&q=80',
      weight: '500g',
      price: 40,
      originalPrice: 56,
      discountPercent: 29,
    ),
    ProductItem(
      id: 'spinach',
      name: 'Spinach',
      imageUrl:
          'https://images.unsplash.com/photo-1576045057995-568f588f82fb?auto=format&fit=crop&w=800&q=80',
      weight: '1 bunch',
      price: 32,
      originalPrice: 44,
      discountPercent: 27,
    ),
    ProductItem(
      id: 'carrots',
      name: 'Carrots',
      imageUrl:
          'https://images.unsplash.com/photo-1447175008436-054170c2e979?auto=format&fit=crop&w=800&q=80',
      weight: '500g',
      price: 52,
      originalPrice: 66,
      discountPercent: 21,
    ),
  ];

  static const List<ProfileStat> profileBaseStats = [
    ProfileStat(label: 'Cart', value: '0', icon: Icons.shopping_cart_outlined),
    ProfileStat(
      label: 'Wishlist',
      value: '0',
      icon: Icons.favorite_border_rounded,
    ),
    ProfileStat(label: 'Rewards', value: '120', icon: Icons.stars_rounded),
  ];
}
