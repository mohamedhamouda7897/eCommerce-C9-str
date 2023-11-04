part of 'home_bloc.dart';

enum ScreenType {
  init,
  loading,
  brandsSuccess,
  brandsError,
  categorySuccess,
  categoryError,
  productSuccess,
  productError,
}

@immutable
class HomeState {
  ScreenType? type;
  List<DataEntity>? brands;
  List<DataEntity>? categories;
  List<ProductData>? products;
  Failures? failures;
  int index;

  HomeState(
      {this.type,
      this.index = 0,
      this.products,
      this.brands,
      this.categories,
      this.failures});

  HomeState copWith({
    ScreenType? type,
    List<DataEntity>? brands,
    List<DataEntity>? categories,
    Failures? failures,
    List<ProductData>? products,
    int index = 0,
  }) {
    return HomeState(
        failures: failures ?? this.failures,
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        index: index ?? this.index,
        products: products ?? this.products,
        type: type ?? this.type);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(type: ScreenType.init, index: 0);
}
