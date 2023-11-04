import 'package:flutter/material.dart';

import 'carditem.dart';

class HomeStart extends StatefulWidget {
  static const String routeName = "HomeStart";

  @override
  State<HomeStart> createState() => _HomeStartState();
}

class _HomeStartState extends State<HomeStart> {
  int index = 0;

  //int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset("assets/images/appbar.png"),
          backgroundColor: Colors.white,
          elevation: 0.0),
      body: Padding(
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
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
              print(index);
            },
            showSelectedLabels: false,
            //backgroundColor: Color(0xff004182),
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/homeicon.png"),
                      size: 35),
                  label: "",
                  backgroundColor: Color(0xff004182)),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/listicon.png"),
                      size: 35),
                  label: "",
                  backgroundColor: Color(0xff004182)),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/heartticon.png"),
                      size: 35),
                  label: "",
                  backgroundColor: Color(0xff004182)),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/usericon.png"),
                      size: 35),
                  label: "",
                  backgroundColor: Color(0xff004182))
            ]),
      ),
    );
  }
}
