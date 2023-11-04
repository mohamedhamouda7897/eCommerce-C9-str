import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/home/data/models/ProductModel.dart';
import 'package:ecommerce_c9_str/features/home/domain/repositories/home_repo.dart';

class GetProductsUseCase {
  HomeRepo homeRepo;

  GetProductsUseCase(this.homeRepo);

  Future<Either<Failures, ProductModel>> call() => homeRepo.getProducts();
}
