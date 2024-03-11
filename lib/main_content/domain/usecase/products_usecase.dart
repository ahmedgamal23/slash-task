import 'package:slash_internship_task/main_content/domain/entity/product.dart';
import '../repository/base_products_repository.dart';

abstract class BaseProductsUseCase{
  Future<List<Product>> execute();
}

class ProductsUseCase extends BaseProductsUseCase{
  BaseProductsRepository baseProductsRepository;
  ProductsUseCase(this.baseProductsRepository);

  @override
  Future<List<Product>> execute() async {
    return await baseProductsRepository.getAllProducts();
  }

}
