import 'package:flutter/material.dart';

class Profilecontent extends StatelessWidget {
  const Profilecontent({super.key});

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;
    return Padding(
        padding:  EdgeInsets.only(top: myheight*0.09),
        child: Column(
          children: [
          
            const Text(
              'اسم المستخدم',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Tajawal'),
            ),
            const Text(
              'user@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Padding(
              padding:  EdgeInsets.only(left: mywidth*0.04,right: mywidth*0.04,top: myheight*0.1),
              child: Container(
  decoration: BoxDecoration(
    color:  Color(0xffFEFEFE),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        blurRadius: 48,
        offset: const Offset(0, 4),
        color: const Color(0xffA7AEC1).withOpacity(0.3),
      ),
    ],
  ),
  child: Directionality(
    textDirection: TextDirection.rtl,
    child: ListTile(
      trailing: const Icon(Icons.arrow_forward_ios),
      title: const Text('تغير كلمة المرور'),
      leading: const Icon(Icons.lock), 
      onTap: () {
      
      },
    ),
  ),
),

            ),
         
           
            Padding(
              padding:  EdgeInsets.only(left: mywidth*0.04,right: mywidth*0.04,top: myheight*0.02),
              child: Container(
                 decoration: BoxDecoration(
                      color: const Color(0xffFEFEFE),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 80,
                          offset: const Offset(0, 4),
                          color: const Color(0xffA7AEC1).withOpacity(0.4)
                        )
                      ]
                    ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    leading: const Icon(Icons.login_outlined, color: Colors.red),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      // قم بإضافة حدث تسجيل الخروج هنا
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    
  }
}