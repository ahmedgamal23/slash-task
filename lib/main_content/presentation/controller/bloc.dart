import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_internship_task/main_content/domain/entity/product.dart';
import 'package:slash_internship_task/main_content/presentation/controller/event.dart';
import 'package:slash_internship_task/main_content/presentation/controller/state.dart';
import '../../domain/usecase/product_details_usecase.dart';
import '../../domain/usecase/products_usecase.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState>{
  BaseProductsUseCase baseProductsUseCase;
  ProductsBloc(this.baseProductsUseCase):super(InitializationState()){
    on<ProductsEvent>((event, emit) async{
      if(event is GetAllProductsEvent){
        List<Product> productList = await baseProductsUseCase.execute();
        emit(GetAllProductsState(result: productList));
      }
    });
  }
}

class ProductDetailsBloc extends Bloc<ProductsEvent, ProductsState>{
  BaseProductDetailsUseCase baseProductDetailsUseCase;
  ProductDetailsBloc(this.baseProductDetailsUseCase):super(InitializationState()){
    on<ProductsEvent>((event, emit) async{
      if(event is GetProductDetailsEvent){
        Product product = await baseProductDetailsUseCase.execute(event.id);
        emit(GetProductDetailsState(product: product));
      }
    });
  }
}
