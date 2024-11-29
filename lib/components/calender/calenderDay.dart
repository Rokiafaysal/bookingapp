import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {
  final DateTime date;
  final bool isHighlighted;

  CalendarDay({required this.date, required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.blue.withOpacity(0.3) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          "${date.day}",
          style: TextStyle(
            color: isHighlighted ? AppColors.primaryColor : Colors.black,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
