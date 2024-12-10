import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/components/BottomBar.dart';
import 'package:bookingapp/screen/bookingScreen.dart';
import 'package:bookingapp/screen/homeContent.dart';
import 'package:bookingapp/screen/profileContent.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    const Bookingscreen(),
    Profilecontent()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 1;
          });
          //    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Bookingscreen(),));
        },
        backgroundColor: AppColors.primaryColor,
        splashColor: AppColors.primaryDark,
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        onFloatingActionButtonPressed: () {
          setState(() {
            _selectedIndex = 1;
            print(_selectedIndex);
          });
        },
      ),
    );
  }
}
