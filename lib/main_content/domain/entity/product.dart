import 'package:slash_internship_task/main_content/domain/entity/product_variations.dart';
import 'brand.dart';

class Product{
  final int id;
  final String name;
  final String description;
  final int brandId;
  final Brand brand;
  final int? rating;
  final List<ProductVariation> variations;


  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    required this.brand,
    required this.rating,
    required this.variations,
  });
}


