import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/features/home/data/models/product_data_models.dart';
import 'package:flutter_training/features/home/home_cubit/home_state.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialState());

  List<ProductDataModel> products = [];

  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    try {
      final uri = Uri.parse('https://fakestoreapi.com/products');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> listOfData = json.decode(response.body);
        for (var map in listOfData) {
          ProductDataModel product = ProductDataModel.fromJson(map);
          products.add(product);
        }
        emit(GetProductsSuccessState());
      } else {
        emit(GetProductsErrorState());
        print('Failed to fetch products');
      }
    } catch (error) {
      emit(GetProductsErrorState());
      print('Error: $error');
    }
  }
}
