import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app_test/models/product_model.dart';
import 'package:food_app_test/utils/constant.dart';
import 'package:food_app_test/utils/dio_exception.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<Either<String, ProductModel>> addProduct(ProductModel data) async {
    Response response;
    try {
      response = await _dio.post(
        baseUrl,
        options: Options(
          method: "POST",
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "X-SECRET-TOKEN": secretToken,
          },
        ),
        data: data.toJson(),
      );
      if (response.statusCode == 201 && response.data != null) {
        ProductModel product = ProductModel.fromJson(response.data);
        return right(product);
      }
      return left("Data kosong");
    } on DioError catch (e) {
      final DioException error = DioException.fromDioError(e);
      return left(error.message);
    }
  }

  Future<Either<String, List<ProductModel>>> getProduct() async {
    Response response;
    try {
      response = await _dio.get(
        baseUrl,
        options: Options(
          method: "GET",
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "X-SECRET-TOKEN": secretToken,
          },
        ),
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        List responseData = response.data;
        List<ProductModel> datas =
            responseData.map((e) => ProductModel.fromJson(e)).toList();
        return right(datas);
      }
      return left("Data kosong");
    } on DioError catch (e) {
      final DioException error = DioException.fromDioError(e);
      return left(error.message);
    }
  }

  Future<Either<String, ProductModel>> editProduct(
      ProductModel data, int id) async {
    Response response;
    try {
      response = await _dio.put(
        "$baseUrl$id",
        options: Options(
          method: "PUT",
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "X-SECRET-TOKEN": secretToken,
          },
        ),
        data: data.toJson(),
      );

      if (response.statusCode == 200 && response.data != null) {
        ProductModel product = ProductModel.fromJson(response.data);
        return right(product);
      }
      return left("Data kosong");
    } on DioError catch (e) {
      final DioException error = DioException.fromDioError(e);
      return left(error.message);
    }
  }

  Future<Either<String, String>> deleteProduct(int id) async {
    try {
      await _dio.delete(
        "$baseUrl$id",
        options: Options(
          method: "DELETE",
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "X-SECRET-TOKEN": secretToken,
          },
        ),
      );

      return right("Sukses delete data");
    } on DioError catch (e) {
      final DioException error = DioException.fromDioError(e);
      return left(error.message);
    }
  }
}
