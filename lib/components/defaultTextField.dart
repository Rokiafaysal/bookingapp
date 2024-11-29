import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData ? icon;
  final bool isPasswordField;
  final TextEditingController textController;
  final TextInputType type;
  final Function? onTap;
  final Color ?color;

  const DefaultTextField({
    super.key,
    required this.label,
    required this.hintText,
     this.icon,
     
    
    this.isPasswordField = false,  // Defaults to false
    required this.textController,
    required this.type, this.onTap, this.color, 
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
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: myheight * (4 / 853)),
          child: Text(
            widget.label,
            style: TextStyle(
              color: AppColors.gray7.withOpacity(0.7),
              fontSize: mywidth * (11 / 393),
              fontWeight: FontWeight.w400,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
        TextField(
          onTap: widget.onTap as void Function()?,
          controller: widget.textController,
          keyboardType: widget.type,
          obscureText: widget.isPasswordField && !_isPasswordVisible,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: EdgeInsets.only(
              top: myheight * (20 / 853),
              right: widget.icon == null ? 16.0 : 0.0, // Add padding if no icon
            ),
            hintStyle: TextStyle(
              fontSize: mywidth * (14 / 393),
              color: AppColors.gray7,
              fontWeight: FontWeight.w400,
              fontFamily: 'Tajawal',
            ),
            prefixIcon: widget.icon != null
                ? Icon(
                    widget.icon,
                    color: AppColors.gray7,
                  )
                : null, // Dynamically remove space if icon is not provided
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.gray7,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : null, // No suffix icon if not a password field
            filled: true,
            fillColor: widget.color ?? AppColors.gray1,
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