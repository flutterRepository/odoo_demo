import 'package:flutter/material.dart';
import 'package:odoo_demo/presentation/core/others/nav_pages/bar_item_page.dart';
import 'package:odoo_demo/presentation/core/others/nav_pages/search_page.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';
import 'package:odoo_demo/presentation/home/home_page.dart';
import 'package:odoo_demo/presentation/user/partners/partners_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _pages = const [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    PartenrPage(),
  ];
  int _pageCurrentIndex = 0;
  void onTap(
    int index,
  ) {
    setState(() {
      _pageCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _pages[_pageCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _pageCurrentIndex,
        elevation: 0,
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.backgroundColor,
        items: const [
          BottomNavigationBarItem(
            // title: Text("Home"),
            label: "Home",
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            // title: Text("Bar"),

            label: "Bar",
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            // title: Text("Search"),

            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            // title: Text("User"),

            label: "User",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
