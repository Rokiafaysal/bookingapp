import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final bool colored;
  final VoidCallback onClick;
  final String text ;
  final Color ?color;
  final double ?width;
  final double ? height;
  final double ?fontsize;
  final Color ?colorButton;
  const DefaultButton({super.key, required this.colored, required this.onClick, required this.text, this.color, this.width, this.height, this.fontsize, this.colorButton});

  @override
  Widget build(BuildContext context) {
    
      double mywidth = MediaQuery.of(context).size.width;
      double myheight= MediaQuery.of(context).size.height;
    return  GestureDetector(
                  onTap: onClick,
                  
                  child: Container(
                    width: width?? mywidth,
                    height: height ?? myheight*(48/853),
                    decoration: BoxDecoration(

                      color: colored ? colorButton?? AppColors.primaryColor : Colors.transparent,
                      borderRadius: const BorderRadius.all( Radius.circular(8))
                    ),
                    child: Center(child: Text(text ,style:  TextStyle(color: color  ?? Colors.white,fontSize: fontsize?? 14,fontFamily: 'Tajawal'),)),
                  
                  ),
                );
  }
}