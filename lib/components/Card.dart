import 'package:flutter/material.dart';

class CardApartment extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  const CardApartment({super.key, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
        double myheight = MediaQuery.of(context).size.height;
        double mywidth = MediaQuery.of(context).size.width;

    return Padding(
                    padding:  EdgeInsets.only(bottom: 12.0,left: mywidth*0.04,right: mywidth*0.04),
                    child: GestureDetector(
                      onTap: onClick,
                      child: Container(
                        height: myheight * (96 / 853),  
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 45,
                              color: Color.fromARGB(255, 19, 19, 24).withOpacity(0.06),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Text(
                      title ,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,fontFamily: 'Tajawal'),
                                ),
                              ),
                              Image.asset('assets/img.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
  }
}