import 'package:slash_internship_task/main_content/domain/entity/product_property.dart';

class ProductPropertyModel extends ProductProperty{
  ProductPropertyModel({
    required super.value,
    required super.property
  });

  factory ProductPropertyModel.fromJson(Map<String, dynamic> json){
    return ProductPropertyModel(
      value: json["value"],
      property: json["property"],
    );
  }

}
