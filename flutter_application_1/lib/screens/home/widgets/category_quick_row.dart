import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/models/category_item.dart';

class CategoryQuickRow extends StatelessWidget {
  const CategoryQuickRow({
    super.key,
    required this.categories,
  });

  final List<CategoryItem> categories;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.map((category) {
        return Expanded(
          child: Column(
            children: [
              Container(
                width: 58,
                height: 58,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: category.bgColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: category.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_outlined,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                category.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                maxLines: 2,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
