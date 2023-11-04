import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_c9_str/core/api/api_manager.dart';
import 'package:ecommerce_c9_str/core/api/endpoints.dart';

import 'package:ecommerce_c9_str/core/error/failures.dart';

import 'package:ecommerce_c9_str/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:ecommerce_c9_str/features/home/data/models/ProductModel.dart';

import '../../data_sources/remote/home_remote_ds.dart';

class HomeRemoteDSImpl implements HomeRemoteDS {
  ApiManager apiManager;

  HomeRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, CategoryAndBrandModel>> getBrands() async {
    try {
      Response response = await apiManager.getData(endPoint: EndPoints.brands);

      CategoryAndBrandModel model =
          CategoryAndBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryAndBrandModel>> getCategories() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.categories);

      CategoryAndBrandModel model =
          CategoryAndBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      print("here y mina");
      Response response =
          await apiManager.getData(endPoint: EndPoints.products);
      ProductModel productModel = ProductModel.fromJson(response.data);

      print(productModel.data?.length);
      print("-------------");
      return Right(productModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
