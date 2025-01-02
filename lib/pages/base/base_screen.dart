import 'package:flutter/material.dart';
import 'package:imperio_das_frutas/pages/cart/cart_tab.dart';
import 'package:imperio_das_frutas/pages/orders/orders_tab.dart';
import 'package:imperio_das_frutas/pages/profile/profile_tab.dart';
import '../home/home_tab.dart';

// ignore: must_be_immutable
class Basescreen extends StatefulWidget {
  const Basescreen({super.key});

  @override
  State<Basescreen> createState() => _BasescreenState();
}

class _BasescreenState extends State<Basescreen> {
  int currentIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState((){
          currentIndex = index;
          pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 81, 0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ), // icons
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'carrinho'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'outros'),
        ],
      ),
    );
  }
}
