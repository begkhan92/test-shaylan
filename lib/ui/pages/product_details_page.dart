import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_exercise_shaylan/logic/logic.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductBloc productBloc;

  ProductDetailsPage({required this.productBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailsLoaded) {
            final product = state.product;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${product.name}',
                      style: const TextStyle(fontSize: 24)),
                  Text('Price: \$${product.price}',
                      style: const TextStyle(fontSize: 20)),
                  Text('Stock: ${product.stock ?? 'N/A'}'),
                  Text('Barcode: ${product.barcode ?? 'N/A'}'),
                  Text('Is on Sale: ${product.isSale == true ? 'Yes' : 'No'}'),
                  Text(
                      'Created Date: ${product.createdDate?.toLocal() ?? 'N/A'}'),
                ],
              ),
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No details available'));
          }
        },
      ),
    );
  }
}
