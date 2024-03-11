abstract class ProductsEvent{}

class GetAllProductsEvent extends ProductsEvent{}

class GetProductDetailsEvent extends ProductsEvent{
  int id;
  GetProductDetailsEvent(this.id);
}
