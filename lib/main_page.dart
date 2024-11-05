import 'package:digikala/screens/authentication/register.dart';
import 'package:digikala/screens/cart/cart_page.dart';
import 'package:digikala/screens/category/category_page.dart';
import 'package:digikala/screens/home/home_page.dart';
import 'package:digikala/screens/magnet/magnet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToHome() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomePage(),
          const CategoryPage(),
          const CartPage(),
          const MagnetPage(),
          RegisterPage(onClose: navigateToHome),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1.2,
              color: Colors.grey,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 0
                    ? 'assets/svg/home_filles.svg'
                    : 'assets/svg/home.svg',
                width: 21,
                height: 21,
              ),
              label: 'خانه',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 1
                    ? 'assets/svg/cate_filled.svg'
                    : 'assets/svg/cat.svg',
                width: 21,
                height: 21,
              ),
              label: 'دسته‌بندی',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 2
                    ? 'assets/svg/cart_filled.svg'
                    : 'assets/svg/cart.svg',
                width: 21,
                height: 21,
              ),
              label: 'سبد خرید',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 3
                    ? 'assets/svg/magnet_filled.svg'
                    : 'assets/svg/magnet.svg',
                width: 21,
                height: 21,
              ),
              label: 'مگنت',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 4
                    ? 'assets/svg/user_filled.svg'
                    : 'assets/svg/user.svg',
                width: 21,
                height: 21,
              ),
              label: 'دیجی‌کالای من',
            ),
          ],
        ),
      ),
    );
  }
}
