import 'package:bookingapp/components/calender/calenderDay.dart';
import 'package:flutter/material.dart';

class CalendarGrid extends StatelessWidget {
  final int year;
  final int month;
  final List<int> highlightedDates;
  final Function(int newYear, int newMonth) onMonthChange;

  CalendarGrid({
    required this.year,
    required this.month,
    required this.highlightedDates,
    required this.onMonthChange,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      
      child: PageView.builder(
        
        
        controller: PageController(initialPage: year * 12 + month),
        onPageChanged: (int page) {
          int newYear = page ~/ 12;
          int newMonth = page % 12;
          onMonthChange(newYear, newMonth + 1);
        },
        itemBuilder: (context, index) {
          int currentYear = index ~/ 12;
          
          int currentMonth = index % 12 + 1;
          List<DateTime> daysInMonth = _generateDaysInMonth(currentYear, currentMonth);
      
          return GridView.builder(
      
            padding: const EdgeInsets.all(8.0),
            itemCount: daysInMonth.length,
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              
              crossAxisCount: 7,
              childAspectRatio: 1.4,
            ),
            itemBuilder: (context, i) {
              DateTime day = daysInMonth[i];
              bool isHighlighted = highlightedDates.contains(day.day);
      
              return CalendarDay(
                date: day,
                isHighlighted: isHighlighted,
              );
            },
          );
        },
      ),
    );
  }

  List<DateTime> _generateDaysInMonth(int year, int month) {
    List<DateTime> days = [];
    DateTime firstDay = DateTime(year, month, 1);
    int daysInMonth = DateTime(year, month + 1, 0).day;

    // Add leading days of the previous month for alignment
    int leadingDays = firstDay.weekday % 7;
    for (int i = 0; i < leadingDays; i++) {
      days.add(firstDay.subtract(Duration(days: leadingDays - i)));
    }

    // Add all days of the current month
    for (int i = 0; i < daysInMonth; i++) {
      days.add(DateTime(year, month, i + 1));
    }

    // Add trailing days of the next month for alignment
    int trailingDays = 7 - (days.length % 7);
    for (int i = 0; i < trailingDays; i++) {
      days.add(DateTime(year, month, daysInMonth + i + 1));
    }

    return days;
  }
}
