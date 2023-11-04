import 'package:ecommerce_c9_str/features/home/data/models/ProductModel.dart';
import 'package:ecommerce_c9_str/core/api/api_manager.dart';
import 'package:ecommerce_c9_str/features/home/data/data_sources/remote/home_remote_ds_impl.dart';
import 'package:ecommerce_c9_str/features/home/data/repositories/home_repo_impl.dart';
import 'package:ecommerce_c9_str/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'package:ecommerce_c9_str/features/home/domain/use_cases/get_brands_usecase.dart';
import 'package:ecommerce_c9_str/features/home/domain/use_cases/get_categories_usecase.dart';
import 'package:ecommerce_c9_str/features/home/domain/use_cases/get_product_usecase.dart';
import 'package:ecommerce_c9_str/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_c9_str/features/home/presentation/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../tabs/products_tab.dart';
import '../tabs/profile.dart';
import '../tabs/fav_tab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          GetBrandsUseCase(
            HomeRepoImpl(
              HomeRemoteDSImpl(
                ApiManager(),
              ),
            ),
          ),
          GetCategoriesUseCase(
            HomeRepoImpl(
              HomeRemoteDSImpl(
                ApiManager(),
              ),
            ),
          ),
          GetProductsUseCase(
            HomeRepoImpl(
              HomeRemoteDSImpl(
                ApiManager(),
              ),
            ),
          ))
        ..add(GetCategoriesEvent())
        ..add(GetProductsEventEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.type == ScreenType.productError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? ""),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Image.asset("assets/images/appbar.png"),
                backgroundColor: Colors.white,
                elevation: 0.0),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value) {
                    BlocProvider.of<HomeBloc>(context)
                        .add(ChangeBottomNavBar(value));
                  },
                  showSelectedLabels: false,
                  //backgroundColor: Color(0xff004182),
                  items: [
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                            AssetImage("assets/images/homeicon.png"),
                            size: 35),
                        label: "",
                        backgroundColor: Color(0xff004182)),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                            AssetImage("assets/images/listicon.png"),
                            size: 35),
                        label: "",
                        backgroundColor: Color(0xff004182)),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                            AssetImage("assets/images/usericon.png"),
                            size: 35),
                        label: "",
                        backgroundColor: Color(0xff004182))
                  ]),
            ),
            body:
                tabs(state.categories ?? [], state.products ?? [])[state.index],
          );
        },
      ),
    );
  }

  List<Widget> tabs(List<DataEntity> cat, List<ProductData> prod) =>
      [HomeTab(cat), ProductsTab(prod), ProfileTab()];
}
/*
* Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff004182)),
                              borderRadius: BorderRadius.circular(30)),
                          prefixIcon: ImageIcon(
                              AssetImage("assets/images/searchicon.png"),
                              color: Color(0xff004182)),
                          labelText: "what do you search for",
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ImageIcon(
                          AssetImage("assets/images/shoppingicon.png"),
                          color: Color(0xff004182),
                        ))
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CardItem();
                    },
                    itemCount: 3,
                  ),
                )
              ]),
            ),*/
