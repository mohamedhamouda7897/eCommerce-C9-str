import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const AppSliderAndCategory());
}

class AppSliderAndCategory extends StatelessWidget {
  const AppSliderAndCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeCategory.routName,
      debugShowCheckedModeBanner: false,
      routes: {HomeCategory.routName: (context) => const HomeCategory()},
    );
  }
}

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});
  static const String routName = 'routeone';

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  double currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items: const [
              BuildImage(
                image: 'assets/images/property1_default.png',
                index: 0,
              ),
              BuildImage(
                image: 'assets/images/group12.png',
                index: 1,
              ),
              BuildImage(
                image: 'assets/images/group13.png',
                index: 2,
              )
            ],
            options: CarouselOptions(
              height: 400,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.linear,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              enlargeFactor: .5,
              pageSnapping: true,
              onScrolled: (value) {
                currentIndex = value!;
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                'view all',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ), 

            ],
          ),
          const SizedBox(
            height: 20,
          ), 
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const BuildCategory(img: 'https://static.vecteezy.com/system/resources/previews/005/883/254/original/page-not-found-404-error-concept-illustration-free-vector.jpg', description: 'Error'), separatorBuilder: (context, index) => const SizedBox(width: 20), itemCount: 30))
        ],
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
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.fill)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
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
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(img, )),
          ),
        ),
        const SizedBox(
          height: 20,
        ), 
        Text(description)
      ],
    );
  }
}
