import '../../domain/entity/product_variant_image.dart';

class ProductVariantImagesModel extends ProductVariantImage{
  ProductVariantImagesModel({
    required super.id,
    required super.imagePath,
    required super.productVariationId
  });

  factory ProductVariantImagesModel.fromJson(Map<String, dynamic> json){
    return ProductVariantImagesModel(
        id: json["id"],
        imagePath: json["image_path"],
        productVariationId: json["product_varient_id"]
    );
  }

}
