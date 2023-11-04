import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Color(0xff004182).withOpacity(0.3),
          )),
      child: Row(
        children: [
          Image.asset("assets/images/testcard.png", width: 120, height: 113),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Nike Air Jordon",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff004182))),
                      Spacer(),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(0, 5))
                            ],
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: ImageIcon(
                            AssetImage("assets/images/heart.png"),
                            color: Color(0xff004182),
                            size: 20,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 13,
                        height: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Text("Black color",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff004182)))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("EGP 1,200",
                        style: TextStyle(
                            color: Color(0xff004182),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("EGP 1,500",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Color(0xff004182),
                              fontSize: 11)),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff004182),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
