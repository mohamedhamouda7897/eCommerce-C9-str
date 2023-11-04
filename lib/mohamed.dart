
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:BottomCategory() ,
      debugShowCheckedModeBanner: false,
    );
  }
}


class BottomCategory extends StatelessWidget {
  const BottomCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Text("Home Appliance",style: TextStyle(
                color: Color(0xff06004F),
                fontSize: 18
              ),)
            ],
          ),
          SizedBox(height: 10,),
          CarouselSlider(
              items:[

                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child:Image.asset("https://www.topgear.com/sites/default/files/2022/07/13.jpg"),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child:Image.network("https://car-images.bauersecure.com/wp-images/164826/1752x1168/best_electric_luxury_car_bmw_i7.jpg?mode=max&quality=90&scale=down"),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoWcVqK8e_jAPt7mgQ9hMPANlQeFZUAeoJpQ&usqp=CAU"),
                ),

              ],
              options: CarouselOptions(
                height: 150,
                enableInfiniteScroll: false,
                clipBehavior: Clip.none,
              )
          ),
        ],
      ),
    );
  }
}

