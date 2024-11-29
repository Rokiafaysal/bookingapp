import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/components/defaultTextField.dart';
import 'package:bookingapp/components/defultButton.dart';
import 'package:bookingapp/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

class Bookingscreen extends StatefulWidget {
  const Bookingscreen({super.key});

  @override
  State<Bookingscreen> createState() => _BookingscreenState();
}


class _BookingscreenState extends State<Bookingscreen> {
  var nameApertmentController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          ' اضافة شقة ',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: AppColors.gray7,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: myheight * 0.1, left: mywidth * 0.04, right: mywidth * 0.04),
        child: Column(
          children: [

            Card(

            
                color:AppColors.gray2,
            child: Column(
              children: [

                Padding(
 padding: EdgeInsets.only(
            top: myheight * 0.02, left: mywidth * 0.02, right: mywidth * 0.02,bottom: myheight*0.04),
                         child: DefaultTextField(
                    color: Colors.white,
                    label: 'اسم الشقة', hintText: "شقة1", textController: nameApertmentController, type: TextInputType.text),
                ),

                Padding(
padding: EdgeInsets.only(
            top: myheight * 0.0, left: mywidth * 0.02, right: mywidth * 0.02,bottom: myheight*0.04),
                   child: DefaultButton(colored: true, onClick: (){

                     showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  insetPadding: const EdgeInsets.all(16),
                                  contentPadding: const EdgeInsets.all(0),
                                  backgroundColor: AppColors.primaryColor,
                                  actions: [
                                    
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 70,
                                              height: 60,
                                              child: Image.asset('assets/done.png')),
                                            const Padding(
                                              padding:  const EdgeInsets.only(top: 16.0),
                                              child: Text(
                                                '  تم اضافة شقة جديدة ',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:  const EdgeInsets.only(top: 30.0),
                                              child: DefaultButton(colored: true, onClick: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                              }, text: 'الرجوع', colorButton: const Color.fromARGB(255, 240, 240, 240),color: AppColors.primaryColor,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                   }, text: 'اصافة'),
                )

              ],
            ),
              
            )
          ],
        ),
      ),
    );
  }
}
