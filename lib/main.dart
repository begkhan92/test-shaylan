import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_exercise_shaylan/logic/blocs/product_bloc/product_bloc.dart';
import 'package:test_exercise_shaylan/services/database_service.dart';
import 'package:test_exercise_shaylan/ui/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await setupDatabase();
  runApp(MainApp(database: database));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.database});
  final Database database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test Shaylan Product App',
      home: BlocProvider(
        create: (context) => ProductBloc(database),
        child: ProductListPage(productBloc: ProductBloc(database)),
      ),
    );
  }
}
