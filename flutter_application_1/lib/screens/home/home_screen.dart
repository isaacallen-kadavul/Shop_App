import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/data/mock_data.dart';
import 'package:flutter_application_1/screens/home/widgets/category_quick_row.dart';
import 'package:flutter_application_1/screens/home/widgets/flash_sale_section.dart';
import 'package:flutter_application_1/screens/home/widgets/home_search_bar.dart';
import 'package:flutter_application_1/screens/home/widgets/location_bar.dart';
import 'package:flutter_application_1/screens/home/widgets/promo_banner_carousel.dart';
import 'package:flutter_application_1/screens/home/widgets/section_header.dart';
import 'package:flutter_application_1/screens/home/widgets/vertical_product_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onOpenCategories});

  final VoidCallback onOpenCategories;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocationBar(),
            const SizedBox(height: 20),
            const HomeSearchBar(),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                style: AppTextStyles.sectionTitle.copyWith(fontSize: 22),
                children: const [
                  TextSpan(
                    text: 'Hi there, ',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  TextSpan(
                    text: "what's fresh today?",
                    style: TextStyle(color: AppColors.primaryGreen),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            PromoBannerCarousel(banners: MockData.banners),
            const SizedBox(height: 28),
            SectionHeader(
              title: 'Shop by category',
              actionLabel: 'See all',
              onActionTap: onOpenCategories,
            ),
            const SizedBox(height: 18),
            CategoryQuickRow(categories: MockData.quickCategories),
            const SizedBox(height: 28),
            FlashSaleSection(products: MockData.flashSaleProducts),
            const SizedBox(height: 28),
            VerticalProductSection(
              title: 'Fresh Vegetables',
              products: MockData.freshVegetablesProducts,
            ),
          ],
        ),
      ),
    );
  }
}
