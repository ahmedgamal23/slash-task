import 'package:slash_internship_task/main_content/data/model/product_property_model.dart';
import 'package:slash_internship_task/main_content/data/model/product_variant_images_model.dart';
import 'package:slash_internship_task/main_content/domain/entity/product_variations.dart';

class ProductVariationModel extends ProductVariation{
  ProductVariationModel({
    required super.id,
    required super.productId,
    required super.price,
    required super.quantity,
    required super.isDefault,
    required super.productVariantImages,
    required super.availableProperties
  });

  factory ProductVariationModel.fromJson(Map<String, dynamic> json){
    return ProductVariationModel(
        id: json["id"],
        productId: json["product_id"],
        price: json["price"],
        quantity: json["quantity"],
        isDefault: json["is_default"],
        productVariantImages: List<ProductVariantImagesModel>.from(
            (json["ProductVarientImages"] as List).map((e) => ProductVariantImagesModel.fromJson(e))
        ),
        availableProperties: json["productPropertiesValues"] != null
            ? List<ProductPropertyModel>.from(
                     (json["productPropertiesValues"] as List).map((e) => ProductPropertyModel.fromJson(e)),
            ) : [],
    );
  }

}

