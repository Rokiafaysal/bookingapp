import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/components/appartmentDetailsCard.dart';
import 'package:bookingapp/data/models/single_appartment_model.dart';
import 'package:bookingapp/main.dart';
import 'package:flutter/material.dart';

class Admindetailsscreen extends StatefulWidget {
  const Admindetailsscreen({super.key});

  @override
  State<Admindetailsscreen> createState() => _AdmindetailsscreenState();
}

class _AdmindetailsscreenState extends State<Admindetailsscreen> {
  @override
  Widget build(BuildContext context) {
      double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: AppColors.gray7,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

             Padding(
               padding:  EdgeInsets.only(right: 16.0,bottom: 12,          top: myheight * 0.02,
),
               child: Text(
                      'المواعيد المحجوزة',
                      style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.gray7,
                      ),
                    ),
             ),

            ListView.builder(
              shrinkWrap:
                  true, 
              itemCount: 10,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent scrolling within ListView
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:Appartmentdetailscard(
                    date: '10 مارس - 15 مارس',
                    description: 'وصف الشقة',
                    onClickDelete: (){},
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
