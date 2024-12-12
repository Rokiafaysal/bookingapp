import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:flutter/material.dart';

class Appartmentdetailscard extends StatelessWidget {
  final String date;
  final String description;
final VoidCallback onClickDelete;

  const Appartmentdetailscard({super.key, required this.date, required this.description, required this.onClickDelete});

  @override
  Widget build(BuildContext context) {
     double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Column(
                    children: [
                      SizedBox(
                                width: mywidth,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                              padding: EdgeInsets.only(right: 140.0),
                              child: Icon(Icons.delete, color: Colors.red,size: 24,),
                                    ),
                                    Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                   date,
                                ),
                                 Text(description),
                              ],
                                    ),
                                    Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xffEFF4FF),
                              ),
                              child: GestureDetector(
                                onTap: onClickDelete,
                                child: const Icon(
                                  Icons.calendar_month_rounded,
                                  color: AppColors.primaryColor,
                                  size: 30,
                                ),
                              ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(top: myheight*0.012),
                                child: Container(
                                  width: mywidth,
                                  height: myheight*0.001,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.1)
                                  ),
                                ),
                              )
                    ],
                  )
        ;
  }
}