import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:web_ap/views/side_bar_screens/banner_screen.dart';
import 'package:web_ap/views/side_bar_screens/buyers_screen.dart';
import 'package:web_ap/views/side_bar_screens/category_screen.dart';
import 'package:web_ap/views/side_bar_screens/orders_screen.dart';
import 'package:web_ap/views/side_bar_screens/product_screen.dart';
import 'package:web_ap/views/side_bar_screens/subcategory_screen.dart';
import 'package:web_ap/views/side_bar_screens/vendors_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _seletedScreen = VendorsScreen();
  ScreenSelecter(item) {
    switch (item.route) {
      case BuyersScreen.routeId:
        setState(() {
          _seletedScreen = BuyersScreen();
        });
        break;

      case VendorsScreen.routeId:
        setState(() {
          _seletedScreen = VendorsScreen();
        });
        break;

      case BannerScreen.routeId:
        setState(() {
          _seletedScreen = BannerScreen();
        });
        break;

      case CategoryScreen.routeId:
        setState(() {
          _seletedScreen = CategoryScreen();
        });
        break;

      case SubcategoryScreen.routeId:
        setState(() {
          _seletedScreen = SubcategoryScreen();
        });
        break;

      case OrderScreen.routeId:
        setState(() {
          _seletedScreen = OrderScreen();
        });
        break;

      case ProductScreen.routeId:
        setState(() {
          _seletedScreen = ProductScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Management'),
      ),
      body: _seletedScreen,
      sideBar: SideBar(
        header: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 1, 58, 105),
          ),
          child: Center(
            child: Text(
              'VENDOR ADMIN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        items: [
          AdminMenuItem(
            title: 'Vendors',
            route: VendorsScreen.routeId,
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Buyer',
            route: BuyersScreen.routeId,
            icon: CupertinoIcons.person,
          ),
          AdminMenuItem(
            title: 'Orders',
            route: OrderScreen.routeId,
            icon: CupertinoIcons.cart_fill,
          ),
          AdminMenuItem(
            title: 'Categories',
            route: CategoryScreen.routeId,
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: 'Sub Categories',
            route: SubcategoryScreen.routeId,
            icon: Icons.category_outlined,
          ),
          AdminMenuItem(
            title: 'Upload Banner',
            route: BannerScreen.routeId,
            icon: CupertinoIcons.plus,
          ),
          AdminMenuItem(
            title: 'Product',
            route: ProductScreen.routeId,
            icon: CupertinoIcons.cart,
          ),
        ],
        selectedRoute: VendorsScreen.routeId,
        onSelected: (item) {
          ScreenSelecter(item);
        },
      ),
    );
  }
}
