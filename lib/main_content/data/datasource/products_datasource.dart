import 'package:slash_internship_task/main_content/data/model/products_model.dart';
import 'package:dio/dio.dart';

abstract class BaseProductsDatasource{
  Future<List<ProductsModel>> getAllProducts();
}

class ProductsDatasource extends BaseProductsDatasource{

  @override
  Future<List<ProductsModel>> getAllProducts() async {
    try{
      //String apiUrl = "https://slash-backend.onrender.com/product";
      String apiUrl = "https://slash-backend.onrender.com/product/?limit=20&page=1";
      final dio = Dio();
      final response = await dio.get(apiUrl);
      if(response.statusCode==200){
        List<dynamic> responseData = response.data["data"];
        List<ProductsModel> products = List.from( responseData.map((e) => ProductsModel.fromJson(e)) );
        return products;
      }else{
        print("Error : ${response.statusMessage}");
        return [];
      }
    }catch(error){
      print("Error when fetsh api : $error");
      throw Exception(error);
    }
  }

}
