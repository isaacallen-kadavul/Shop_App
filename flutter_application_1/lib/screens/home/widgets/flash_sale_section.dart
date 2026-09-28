import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/screens/home/widgets/product_grid_card.dart';
import 'package:flutter_application_1/screens/home/widgets/section_header.dart';

class FlashSaleSection extends StatefulWidget {
  const FlashSaleSection({super.key, required this.products});

  final List<ProductItem> products;

  @override
  State<FlashSaleSection> createState() => _FlashSaleSectionState();
}

class _FlashSaleSectionState extends State<FlashSaleSection> {
  static const Duration _initialDuration = Duration(minutes: 59, seconds: 49);

  late Duration _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = _initialDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_remaining.inSeconds <= 1) {
          _remaining = _initialDuration;
        } else {
          _remaining -= const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final hours = _remaining.inHours.toString().padLeft(2, '0');
    final minutes = (_remaining.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_remaining.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: '\u26A1 Flash Sale',
          subtitle: 'Ends in $_formattedTime',
          actionLabel: 'See all',
          onActionTap: () {},
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 278,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: widget.products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return ProductGridCard(
                product: widget.products[index],
                width: 176,
              );
            },
          ),
        ),
      ],
    );
  }
}
