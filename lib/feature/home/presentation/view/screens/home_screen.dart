import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/tabs/cart_tab.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/tabs/categories_tab.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/tabs/home_tab.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget>screens=[
    const HomeTab(),
    const CategoriesTab(),
    const CartTab(),
    const ProfileTab(),

  ];
  int currindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currindex],
bottomNavigationBar: BottomNavigationBar(
  currentIndex: currindex,
    selectedItemColor: AppColors.pink,
    unselectedItemColor: AppColors.grey,
    elevation: 1.0,
    onTap: (index){
      currindex=index;
      setState(() {

      });
    },
    items: [
      BottomNavigationBarItem(icon: const Icon(CupertinoIcons.home),label: AppLocalizations.of(context)!.homeTab,),
      BottomNavigationBarItem(icon: const Icon(Icons.category_outlined),label: AppLocalizations.of(context)!.categories,),
      BottomNavigationBarItem(icon: const Icon(CupertinoIcons.cart),label: AppLocalizations.of(context)!.cart,),
      BottomNavigationBarItem(icon: const Icon(Icons.person),label: AppLocalizations.of(context)!.profileTab,),


    ]),
    );
  }
}
