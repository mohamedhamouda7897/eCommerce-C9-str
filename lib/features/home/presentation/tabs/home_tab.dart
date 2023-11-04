import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_c9_str/ahmed_rageb.dart';
import 'package:ecommerce_c9_str/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatelessWidget {
  List<DataEntity> categories;

  HomeTab(this.categories);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Container(
              height: 320.h,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuildCategory(
                    img: categories[index].image ?? "",
                    description: categories[index].name ?? "",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
