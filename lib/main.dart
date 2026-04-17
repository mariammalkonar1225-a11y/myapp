import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'reviews_page.dart';
import 'about_page.dart';

void main() {
  runApp(KitchenApp());
}

class KitchenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kitchen Store",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  final pages = [HomePage(), CartPage(), ReviewsPage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.deepOrange,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Reviews"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}
