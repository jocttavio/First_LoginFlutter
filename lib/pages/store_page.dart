import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_first/components/bottom_nav_bar.dart';
import 'package:login_first/pages/cart_page.dart';
import 'package:login_first/pages/shop_page.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  //this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  //this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  //pages to display
  final List<Widget> _pages = [
    //SHop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyButtomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          )),
      drawer: Drawer(
        backgroundColor: Colors.pink.shade500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //  logo
                DrawerHeader(
                  child: Image.asset(
                    'lib/images/logo.png',
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                //  other pages
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Inicio',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Acerca de',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                child: IconButton(
                    onPressed: signUserOut,
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 45,
                    ))),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
