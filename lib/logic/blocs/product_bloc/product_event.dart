abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}

class FetchProductDetails extends ProductEvent {
  final int productId;
  FetchProductDetails(this.productId);
}
