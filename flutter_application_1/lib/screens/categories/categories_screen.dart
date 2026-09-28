import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/data/mock_data.dart';
import 'package:flutter_application_1/screens/categories/widgets/category_grid_tile.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shop by Category', style: AppTextStyles.screenTitle),
            const SizedBox(height: 8),
            Text(
              'Explore fresh essentials across departments',
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: MockData.allCategories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                return CategoryGridTile(
                  category: MockData.allCategories[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
