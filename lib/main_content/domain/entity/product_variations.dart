import 'package:slash_internship_task/main_content/domain/entity/product_property.dart';
import 'package:slash_internship_task/main_content/domain/entity/product_variant_image.dart';

class ProductVariation{
  final int? id;
  final int? productId;
  final int? price;
  final int? quantity;
  bool? isDefault;
  List<ProductVariantImage> productVariantImages;
  final List<ProductProperty> availableProperties;

  ProductVariation({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.isDefault,
    required this.productVariantImages,
    required this.availableProperties
  });
}
