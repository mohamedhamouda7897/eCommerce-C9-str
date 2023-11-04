import 'package:ecommerce_c9_str/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/home/data/models/ProductModel.dart';

class ProductListIem extends StatelessWidget {
  ProductData item;

  ProductListIem(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.productDetails);
      },
      child: Container(
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
                    item.images?[0] ?? "",
                    fit: BoxFit.cover,
                    width: 191.0.w,
                    height: 126.0.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        item.title ?? "",
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
                            item.price.toString(),
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
                            item.price.toString(),
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
                            'Review (${item.ratingsAverage})',
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
      ),
    );
  }
}

class CustomColors {
  static Color textColor = const Color(0xFF06004F);
  static Color oldPriceColor = const Color(0xFF004182).withOpacity(0.6);
  static Color borderColor = const Color(0xFF004182).withOpacity(0.3);
}
