import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int num = 1;

  final url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvBOxKoUkSS7aKh16rNKGzjF9XH-0TGp3WgQ&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 113,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 113,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: Image.network(
                      url,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Nike Air Jordon",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 6,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Orange | Size:40"),
                        ],
                      ),
                      Text("EGP 3,500",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 8,
              right: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                          color: Color(0xff004182),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (num > 0) {
                                  num--;
                                } else {
                                  return;
                                }
                                setState(() {});
                              },
                              iconSize: 22,
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                              )),
                          Text(
                            num.toString(),
                            style: TextStyle(color: Colors.white,fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  num++;
                                });
                              },
                              iconSize: 22,
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [BoxShadow(
            //offset: Offset(0, -5),
            blurRadius: 15,
            color: Colors.grey.shade400.withOpacity(.20)
          )]),
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Price",style: TextStyle(fontSize: 18),),
                    SizedBox(height: 8,),
                    Text("EGP 3,500",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                  ],
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 48,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Color(0xff004182),
                        borderRadius: BorderRadius.circular(25),
                       ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Check Out",style: TextStyle(color: Colors.white,
                        fontSize: 20,fontWeight: FontWeight.w600),),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_right_alt_outlined,size: 30,color: Colors.white,)

                      ],
                    ),
                  ),
                )
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
