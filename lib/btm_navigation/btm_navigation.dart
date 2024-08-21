import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopnow/navigation_provider/navigation_provider.dart';
import 'package:shopnow/profile/profile.dart';
import 'package:shopnow/shopingpage/homepage.dart';

class BtmNavigation extends StatelessWidget {
   final List<dynamic> screens = [
    const Homepage(),
    const Profile(),
    const Profile(),
  
  ];
  @override
  Widget build(BuildContext context) {
    final screenindexprovider = Provider.of<NavigationProvider>(context);
    int currentScreenIndex = screenindexprovider.fetchCurrentScreenIndex;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        elevation: 1.5,
        currentIndex: currentScreenIndex,
        onTap: (value) => screenindexprovider.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                (currentScreenIndex == 0) ? Icons.home : Icons.home_outlined,
                color: const Color.fromARGB(255, 27, 137, 97),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 2)
                  ? Icons.shopping_bag
                  : Icons.shopping_bag_outlined,
              color: const Color.fromRGBO(27, 137, 97, 1),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 3)
               ? Icons.person 
               : Icons.person_outline,
              color: const Color.fromARGB(255, 27, 137, 97),
            ),
          ),
        ],
      ),
      body: screens[currentScreenIndex],
    );
  }
}
