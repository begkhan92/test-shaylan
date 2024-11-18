import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_exercise_shaylan/data/data.dart';
import 'package:test_exercise_shaylan/logic/logic.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Dio _dio = Dio();
  final Database _database;

  ProductBloc(this._database) : super(ProductInitial()) {
    on<FetchProducts>(_fetchProducts);
    on<FetchProductDetails>(_fetchProductDetails);
  }

  Future<void> _fetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final response = await _dio.get('/api/products');
      List<Product> products = (response.data as List)
          .map((item) => Product.fromJson(item))
          .toList();

      for (var product in products) {
        await _database.insert(
          'products',
          product.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Something went wrong, Failed to load products: $e'));
    }
  }

  Future<void> _fetchProductDetails(
      FetchProductDetails event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final response = await _dio.get('/api/products?id=${event.productId}');
      final product = Product.fromJson(response.data);
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductError(
          'Something went wrong, Failed to load product details: $e'));
    }
  }
}
