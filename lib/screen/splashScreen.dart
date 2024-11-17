import 'package:bookingapp/components/defultButton.dart';
import 'package:bookingapp/screen/loginScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width:mywidth ,
                height: myheight,
                child: Image.asset('assets/spl.png',fit: BoxFit.fill,)),


                Positioned(
                  bottom: myheight*0.04,
                  left: mywidth*0.04,
                  right: mywidth*0.04,
                  child: DefaultButton(colored: true, onClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen(),));
                  }, text: 'تسجيل الدخول'))
            ],

          
          )
        ],
      ),
    );
  }
}