import 'package:bookingapp/components/defaultTextField.dart';
import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController dateController;

  DatePickerField({
    Key? key,
    required this.dateController,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), // Current date
        firstDate: DateTime(1920), // Earliest possible date
        lastDate: DateTime(2100) // Set the lastDate to today or a future date
        );

    if (pickedDate != null) {
      setState(() {
        widget.dateController.text =
            pickedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextField(
          icon: Icons.calendar_month,
          type: TextInputType.datetime,
          onTap: () => _selectDate(context),
          label: widget.labelText,
          hintText: widget.hintText,
          textController: widget.dateController,
        ),
      ],
    );
  }
}
