import 'package:ecommerce_c9_str/minaa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_c9_str/features/home/data/models/ProductModel.dart';

class ProductsTab extends StatelessWidget {
  List<ProductData> items;

  ProductsTab(this.items);

  @override
  Widget build(BuildContext context) {
    print(items.length);
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16.0,
        mainAxisExtent: MediaQuery.of(context).size.height - 652.h,
        crossAxisCount: 2,
      ),
      itemCount: items.length,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
        vertical: 24.0.h,
      ),
      itemBuilder: (context, index) {
        return ProductListIem(items[index]);
      },
    );
  }
}
