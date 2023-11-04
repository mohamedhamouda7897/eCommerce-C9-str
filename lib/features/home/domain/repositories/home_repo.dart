import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/home/data/models/ProductModel.dart';
import 'package:ecommerce_c9_str/features/home/domain/entities/CategoryAndBrandEntity.dart';

abstract class HomeRepo {
  Future<Either<Failures, CategoryAndBrandEntity>> getBrands();

  Future<Either<Failures, CategoryAndBrandEntity>> getCategories();

  Future<Either<Failures, ProductModel>> getProducts();
}
