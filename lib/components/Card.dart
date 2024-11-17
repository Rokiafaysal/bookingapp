import 'package:flutter/material.dart';

class CardApartment extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  const CardApartment({super.key, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
        double myheight = MediaQuery.of(context).size.height;

    return Padding(
                    padding:  EdgeInsets.only(bottom: 12.0),
                    child: GestureDetector(
                      onTap: onClick,
                      child: Container(
                        height: myheight * (96 / 853),  // Adjust height based on screen size
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 45,
                              color: Color(0xff1B1B4D).withOpacity(0.07),
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
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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