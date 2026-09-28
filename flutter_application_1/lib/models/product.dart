class ProductItem {
  const ProductItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.price,
    required this.originalPrice,
    required this.discountPercent,
  });

  final String id;
  final String name;
  final String imageUrl;
  final String weight;
  final double price;
  final double originalPrice;
  final int discountPercent;
}
