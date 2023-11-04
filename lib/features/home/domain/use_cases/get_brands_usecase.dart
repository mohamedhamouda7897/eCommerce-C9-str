import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/home/domain/entities/CategoryAndBrandEntity.dart';
import '../repositories/home_repo.dart';

class GetBrandsUseCase {
  HomeRepo homeRepo;

  GetBrandsUseCase(this.homeRepo);

  Future<Either<Failures, CategoryAndBrandEntity>> call() =>
      homeRepo.getBrands();
}
