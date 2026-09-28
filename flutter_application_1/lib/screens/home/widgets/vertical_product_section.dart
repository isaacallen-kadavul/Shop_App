import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/screens/home/widgets/product_grid_card.dart';
import 'package:flutter_application_1/screens/home/widgets/section_header.dart';

class VerticalProductSection extends StatelessWidget {
  const VerticalProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  final String title;
  final List<ProductItem> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title, actionLabel: 'See all', onActionTap: () {}),
        const SizedBox(height: 18),
        SizedBox(
          height: 278,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return ProductGridCard(product: products[index], width: 176);
            },
          ),
        ),
      ],
    );
  }
}
