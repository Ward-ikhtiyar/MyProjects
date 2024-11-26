import 'package:flutter/material.dart';
import 'package:flutter_application_4/HomePage.dart';
import 'package:flutter_application_4/MePage.dart';
import 'package:flutter_application_4/main.dart';
import 'package:flutter_application_4/secondPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pc = PageController();
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (val) {
            setState(() {
              context.read<Model>().Loginfalse();
              selectedindex = val;
              pc.jumpToPage(selectedindex);
            });
          },
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          unselectedItemColor: Colors.black,
          elevation: 9,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: (selectedindex == 0)
                    ? const Icon(Icons.house_rounded)
                    : const Icon(Icons.house_outlined),
                label: "Home"),
            BottomNavigationBarItem(
                icon: (selectedindex == 1)
                    ? const Icon(Icons.shopping_cart)
                    : const Icon(Icons.shopping_cart_outlined),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: (selectedindex == 2)
                    ? const Icon(Icons.person)
                    : const Icon(Icons.person_2_outlined),
                label: "Me")
          ]),
      body: Container(
          color: Colors.white,
          child: PageView(
            controller: pc,
            onPageChanged: (value) {
              setState(() {
                selectedindex = value;
              });
            },
            children: const [ProductPage(), CartPage(), Mepage()],
          )),
    );
    //});
  }
}
