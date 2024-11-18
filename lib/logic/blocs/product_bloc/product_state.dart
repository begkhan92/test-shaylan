import 'package:test_exercise_shaylan/data/data.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductDetailsLoaded extends ProductState {
  final Product product;
  ProductDetailsLoaded(this.product);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
