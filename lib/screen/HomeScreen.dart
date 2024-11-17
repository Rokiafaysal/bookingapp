import 'package:bookingapp/components/Card.dart';
import 'package:bookingapp/screen/ApartmentDetails.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: myheight * (67 / 853),
          left: mywidth * 0.04,
          right: mywidth * 0.04,
        ),
        child: SingleChildScrollView(  
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اسم المستخدم',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,  
                
                physics: NeverScrollableScrollPhysics(),  
                itemCount: 10,  
                itemBuilder: (context, index) {
                  return  CardApartment(title: 'اسم الشقة',
                  onClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Apartmentdetails(),));
                  },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
