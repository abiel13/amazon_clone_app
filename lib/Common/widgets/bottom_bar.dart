import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavigationBarWidth = 42;
  double bottomBorderWidht = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavigationBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 0
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBorderWidht),
                  ),
                ),
                child: const Icon(Icons.home_outlined),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomNavigationBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 1
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBorderWidht),
                  ),
                ),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: 'Profile'),
          //cart
          BottomNavigationBarItem(
              tooltip: 'View Cart',
              icon: Container(
                width: bottomNavigationBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBorderWidht),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsetsDirectional.only(top: 8),
                  child: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -7, end: -2),
                      badgeContent: const Text('3'),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.white,
                        elevation: 0,
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                      )),
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
