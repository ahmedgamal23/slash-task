import 'package:slash_internship_task/main_content/data/model/product_variation_model.dart';
import 'package:slash_internship_task/main_content/domain/entity/brand.dart';
import 'package:slash_internship_task/main_content/domain/entity/product.dart';

class ProductsModel extends Product{
  ProductsModel({
    required super.id,
    required super.name,
    required super.description,
    required super.brandId,
    required super.brand,
    required super.rating,
    required super.variations,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json){

    return ProductsModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      brandId: json["brand_id"],
      brand: Brand(
        id: json["Brands"]?["id"],
        brandType: json["Brands"]?["brand_type"],
        brandDescription: json["Brands"]?["brand_description"],
        brandLogoImagePath: json["Brands"]?["brand_logo_image_path"]
      ),
      rating: json["product_rating"],
      variations: List<ProductVariationModel>.from( (json["ProductVariations"] as List).map((e) => ProductVariationModel.fromJson(e) ) ),
    );
  }

}
