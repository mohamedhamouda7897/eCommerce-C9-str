import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const AppSliderAndCategory());
}

class AppSliderAndCategory extends StatelessWidget {
  const AppSliderAndCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            initialRoute: HomeCategory.routName,
            debugShowCheckedModeBanner: false,
            routes: {HomeCategory.routName: (context) => const HomeCategory()},
          );
        });
  }
}

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});
  static const String routName = 'routeone';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: CarouselSlider(
                  items: const [
                    SizedBox(
                      child: BuildImage(
                        image: 'assets/images/property1_default.png',
                        index: 0,
                      ),
                    ),
                    SizedBox(
                      child: BuildImage(
                        image: 'assets/images/group12.png',
                        index: 1,
                      ),
                    ),
                    SizedBox(
                      child: BuildImage(
                        image: 'assets/images/group13.png',
                        index: 2,
                      ),
                    )
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                  ),
                ),
              ),
               SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'view all',
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 3,
                    crossAxisCount: 2,
                    childAspectRatio: 2.3,
                  ),
                  itemCount: 80,
                  itemBuilder: (BuildContext context, int index) {
                    return const BuildCategory(
                      img:
                          'https://th.bing.com/th/id/R.16e5970f938011ce262701a9e2cc2dd1?rik=ffV0C3V0MCn45g&pid=ImgRaw&r=0',
                      description: 'Error 404',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({super.key, required this.image, required this.index});
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.w),
          width: MediaQuery.of(context).size.width,
          height: 200.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          bottom: 15.h,
          child: AnimatedSmoothIndicator(
              duration: const Duration(milliseconds: 400),
              activeIndex: index,
              count: 3,
              effect: const SwapEffect()),
        )
      ],
    );
  }
}

class BuildCategory extends StatelessWidget {
  const BuildCategory(
      {super.key, required this.img, required this.description});
  final String img;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(
                  img,
                ),
                fit: BoxFit.fill),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: 65.w,
          child: Text(
            description,
            style: GoogleFonts.poppins(
                color: const Color(0xff06004F),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
