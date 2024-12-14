import 'package:bookingapp/components/calender/calenderDay.dart';
import 'package:flutter/material.dart';

class CalendarGrid extends StatelessWidget {
  final int year;
  final int month;
  final List<DateTime> highlightedDates;
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
        controller: PageController(initialPage: (year - 1) * 12 + (month - 1)),
        onPageChanged: (int page) {
          int newYear = page ~/ 12 + 1;
          int newMonth = page % 12 + 1;
          onMonthChange(newYear, newMonth);
        },
        itemBuilder: (context, index) {
          int currentYear = index ~/ 12 + 1;
          int currentMonth = index % 12 + 1;
          List<CalendarCell> calendarCells =
              _generateCalendarCells(currentYear, currentMonth);

          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: calendarCells.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.4,
            ),
            itemBuilder: (context, i) {
              final cell = calendarCells[i];
              bool isHighlighted = highlightedDates.any((d) =>
                  d.year == cell.date.year &&
                  d.month == cell.date.month &&
                  d.day == cell.date.day);

              return cell.isCurrentMonth
                  ? CalendarDay(
                      date: cell.date,
                      isHighlighted: cell.isCurrentMonth && isHighlighted,
                      //isInactive: !cell.isCurrentMonth,
                    )
                  : const SizedBox();
            },
          );
        },
      ),
    );
  }

  List<CalendarCell> _generateCalendarCells(int year, int month) {
    List<CalendarCell> cells = [];
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    int daysInMonth = DateTime(year, month + 1, 0).day;

    // Calculate leading empty slots for alignment
    int leadingEmptySlots = firstDayOfMonth.weekday % 7;

    // Add empty cells for the leading slots
    for (int i = 0; i < leadingEmptySlots; i++) {
      cells.add(CalendarCell(
        date: firstDayOfMonth.subtract(Duration(days: leadingEmptySlots - i)),
        isCurrentMonth: false,
      ));
    }

    // Add cells for the current month
    for (int i = 1; i <= daysInMonth; i++) {
      cells.add(CalendarCell(
        date: DateTime(year, month, i),
        isCurrentMonth: true,
      ));
    }

    // Calculate trailing empty slots for alignment
    int trailingEmptySlots = (7 - cells.length % 7) % 7;

    // Add empty cells for the trailing slots
    for (int i = 0; i < trailingEmptySlots; i++) {
      cells.add(CalendarCell(
        date: DateTime(year, month, daysInMonth + i + 1),
        isCurrentMonth: false,
      ));
    }

    return cells;
  }
}

class CalendarCell {
  final DateTime date;
  final bool isCurrentMonth;

  CalendarCell({required this.date, required this.isCurrentMonth});
}
