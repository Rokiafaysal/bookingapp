import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPasswordField;
  final TextEditingController textController;
  final TextInputType type;

  const DefaultTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPasswordField = false,  // Defaults to false
    required this.textController,
    required this.type,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;
    return Directionality( // Ensures RTL layout
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: myheight * (4 / 853)),
            child: Text(
              widget.label,
              style: TextStyle(
                color: AppColors.gray7.withOpacity(0.8),
                fontSize: mywidth * (11 / 393),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextField(
            controller: widget.textController,
            keyboardType: widget.type,
            obscureText: widget.isPasswordField && !_isPasswordVisible,
            textAlign: TextAlign.right, // Align text to the right
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: EdgeInsets.only(top: myheight * (20 / 853)),
              hintStyle: TextStyle(
                fontSize: mywidth * (14 / 393),
                color: AppColors.gray7,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(
                widget.icon,
                color: AppColors.gray7,
              ),
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.gray7,
                      ),
                      onPressed: _togglePasswordVisibility,
                    )
                  : null, // No suffix icon if not a password field
              filled: true,
              fillColor: AppColors.gray1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
