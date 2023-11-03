import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        // minTextAdapt: true,
        // splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            initialRoute: ProductListScreen.routeName,
            debugShowCheckedModeBanner: false,
            routes: {
              ProductListScreen.routeName: (context) =>
                  const ProductListScreen()
            },
          );
        });
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});
  static const String routeName = 'product';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.height - 656.h,
              crossAxisSpacing: 16.0),
          itemCount: 20,
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
            vertical: 24.0.h,
          ),
          itemBuilder: (context, index) {
            return const ProductListIem();
          },
        ),
      ),
    );
  }
}

class ProductListIem extends StatelessWidget {
  const ProductListIem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: CustomColors.borderColor,
          width: 3.0.w,
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/7ebea844-598a-4303-976a-5ce9da90db71/air-jordan-1-elevate-low-shoes-8wFtWd.png",
                  fit: BoxFit.cover,
                  width: 191.0.w,
                  height: 128.0.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      'Nike Air Jordon Nike shoes flexible for women',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0.sp,
                        color: CustomColors.textColor,
                      ),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'EGP 1,200',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0.sp,
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 16.0.w,
                        ),
                        Text(
                          '2000 EGP',
                          style: GoogleFonts.poppins(
                            fontSize: 11.0.sp,
                            color: CustomColors.oldPriceColor,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Review (4.6)',
                          style: GoogleFonts.poppins(
                            fontSize: 12.0.sp,
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 4.0.w,
                        ),
                        SvgPicture.asset(
                          'assets/images/starIcon.svg',
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/plusCircleIcon.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/images/heartCircleIcon.svg',
          ),
        ],
      ),
    );
  }
}

class CustomColors {
  static Color textColor = const Color(0xFF06004F);
  static Color oldPriceColor = const Color(0xFF004182).withOpacity(0.6);
  static Color borderColor = const Color(0xFF004182).withOpacity(0.3);
}
