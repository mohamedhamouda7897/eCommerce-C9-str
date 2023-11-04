import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:ecommerce_c9_str/features/home/data/models/ProductModel.dart';
import 'package:ecommerce_c9_str/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'package:ecommerce_c9_str/features/home/domain/use_cases/get_brands_usecase.dart';
import 'package:ecommerce_c9_str/features/home/domain/use_cases/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/use_cases/get_product_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  GetBrandsUseCase getBrandsUseCase;
  GetCategoriesUseCase getCategoriesUseCase;
  GetProductsUseCase getProductsUseCase;

  HomeBloc(
      this.getBrandsUseCase, this.getCategoriesUseCase, this.getProductsUseCase)
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetBrandsEvent) {
        emit(state.copWith(type: ScreenType.loading));
        var result = await getBrandsUseCase();
        result.fold((l) {
          emit(state.copWith(type: ScreenType.brandsError, failures: l));
        }, (r) {
          emit(state.copWith(type: ScreenType.brandsSuccess, brands: r.data));
        });
      } else if (event is GetCategoriesEvent) {
        emit(state.copWith(type: ScreenType.loading));
        var result = await getCategoriesUseCase();
        result.fold((l) {
          emit(state.copWith(type: ScreenType.categoryError, failures: l));
        }, (r) {
          emit(state.copWith(
              type: ScreenType.categorySuccess, categories: r.data));
        });
      } else if (event is ChangeBottomNavBar) {
        emit(state.copWith(index: event.index));
      } else if (event is GetProductsEventEvent) {
        emit(state.copWith(type: ScreenType.loading));
        var result = await getProductsUseCase();
        result.fold((l) {
          emit(state.copWith(type: ScreenType.productError, failures: l));
        }, (r) {
          emit(state.copWith(
              type: ScreenType.productSuccess, products: r.data ?? []));
        });
      }
    });
  }
}
