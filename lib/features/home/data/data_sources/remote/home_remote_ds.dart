import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:ecommerce_c9_str/features/home/data/models/ProductModel.dart';

abstract class HomeRemoteDS {
  Future<Either<Failures, CategoryAndBrandModel>> getBrands();

  Future<Either<Failures, CategoryAndBrandModel>> getCategories();

  Future<Either<Failures, ProductModel>> getProducts();
}
