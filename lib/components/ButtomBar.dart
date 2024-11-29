import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final VoidCallback onFloatingActionButtonPressed;

  const CustomBottomBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onFloatingActionButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5.9,
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      shadowColor: const Color.fromARGB(255, 20, 20, 20).withOpacity(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(
            text: 'الحساب',
            icon: Icons.person,
            index: 2,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          ),
          const SizedBox(width: 40), // Empty space for FloatingActionButton
          _buildTabItem(
            text: 'الرئيسية',
            icon: Icons.home_filled,
            index: 0,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required String text,
    required int index,
    required int selectedIndex,
    required Function(int) onItemTapped,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onItemTapped(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0), 
          color: selectedIndex == index
              ? Colors.transparent 
              : Colors.transparent, // Default background
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: selectedIndex == index
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: selectedIndex == index
                      ? AppColors.primaryColor
                      : Colors.grey,
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
