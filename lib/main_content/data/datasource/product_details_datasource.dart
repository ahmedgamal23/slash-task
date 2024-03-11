import 'package:dio/dio.dart';
import '../model/product_details_model.dart';

abstract class BaseProductDetailsDatasource{
  Future<ProductDetailsModel> getProductDetails(int productId);
}

class ProductDetailsDatasource extends BaseProductDetailsDatasource{

  @override
  Future<ProductDetailsModel> getProductDetails(int productId) async {
    try{
      String path = "https://slash-backend.onrender.com/product/$productId";
      final dio = Dio();
      final response = await dio.get(path);
      if(response.statusCode == 200){
        Map<String, dynamic> responseData = response.data["data"];
        print("***********");
        print(responseData);
        print("***********");
        return ProductDetailsModel.fromJson(responseData);
      }else{
        print("Error in fetch data ${response.statusCode} - ${response.statusMessage}");
        throw Exception(response.statusMessage);
      }
    }catch(error){
      throw Exception(error);
    }
  }
}
