import 'package:dartz/dartz.dart';

import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/home/data/data_sources/remote/home_remote_ds.dart';
import 'package:ecommerce_c9_str/features/home/data/models/ProductModel.dart';

import 'package:ecommerce_c9_str/features/home/domain/entities/CategoryAndBrandEntity.dart';

import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDS homeRemoteDS;

  HomeRepoImpl(this.homeRemoteDS);

  @override
  Future<Either<Failures, CategoryAndBrandEntity>> getBrands() {
    return homeRemoteDS.getBrands();
  }

  @override
  Future<Either<Failures, CategoryAndBrandEntity>> getCategories() {
    return homeRemoteDS.getCategories();
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() {
    return homeRemoteDS.getProducts();
  }
}
