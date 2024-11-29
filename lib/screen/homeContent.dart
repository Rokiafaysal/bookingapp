import 'package:bookingapp/components/Card.dart';
import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/screen/ApartmentDetails.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        top: myheight * (48/ 853),
       
      ),
      child: SingleChildScrollView(
        
        child: Column(
          children: [
             const Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    
                    'اسم المستخدم',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: AppColors.gray7,fontFamily: 'Tajawal'),
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardApartment(
                  title: 'اسم الشقة',
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Apartmentdetails(),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}