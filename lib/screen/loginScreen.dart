import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/components/defaultTextField.dart';
import 'package:bookingapp/components/defultButton.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
    var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Widget build(BuildContext context) {
   double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: myheight * 0.18,
              left: mywidth * 0.04,
              right: mywidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome Back ',
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: myheight * (96 / 853)),
                child: DefaultTextField(
                  hintText: 'Enter your email',
                  label: "Email",
                  icon: Icons.email,
                  textController: emailController,
                  type: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: myheight * (12 / 853)),
                child: DefaultTextField(
                  hintText: 'Enter your password',
                  label: "Password",
                  icon: Icons.lock,
                  isPasswordField: true,
                  type: TextInputType.visiblePassword,
                  textController: passwordController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: myheight * (70 / 853)),
                child: DefaultButton(
                    colored: true, onClick: () {
                    }, text: 'Login'),
              ),
              Padding(
                padding: EdgeInsets.only(top: myheight * (12 / 853)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have account? ',
                      style: TextStyle(color: Color(0xff4E5856), fontSize: 14),
                    ),
                    GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const Signup(),
                          //     ));
                        },
                        child: const Text(
                          'Register',
                          style:  TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
