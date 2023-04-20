import 'package:e_commerce_advance/viewmodelorcontoller/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
     final List<Widget>  _pages = [
 const HomePage()
];
    return Scaffold(
      body: Center(
       
        child: _pages.elementAt(Provider.of<NavBarProvider>(context).currentIndexs),
       
      ),
      bottomNavigationBar: Consumer<NavBarProvider>(
        
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value.currentIndexs,
          onTap:(v) {
            value.currentIndexs=v;
          },
        
          iconSize: 25.sp,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.picture_in_picture),
              label: 'Profile',
            ),
            
          ],
          backgroundColor: Colors.amber,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.red,
          // onTap: (index) {
          //   value.currentIndex = index;
          // },

          
        ),
      ),
    );
  }
}
