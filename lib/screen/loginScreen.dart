import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/components/defaultTextField.dart';
import 'package:bookingapp/components/defultButton.dart';
import 'package:bookingapp/domain/repo_impl/user_repo/users_repo_impl.dart';
import 'package:bookingapp/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with Image and Welcome Text
            Stack(
              children: [
                SizedBox(
                  height: myheight * 0.35, // Adjusted height for top section
                  width: mywidth,
                  child: Image.asset(
                    'assets/bg.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  bottom: myheight * 0.04, // Adjusted position for welcome text
                  right: mywidth * 0.1,
                  child: Text(
                    "! مرحباً بعودتك",
                    style: TextStyle(
                      fontSize: mywidth * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            // Bottom Container
            Container(
              height: myheight, // Adjusted to match the top section height
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(62),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mywidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: myheight * 0.1),

                    SizedBox(height: myheight * 0.02),
                    DefaultTextField(
                      hintText: ' اسم المستخدم ',
                      label: "ادخل اسم المستخدم ",
                      icon: Icons.email,
                      textController: emailController,
                      type: TextInputType.emailAddress,
                    ),

                    // Password Field
                    SizedBox(height: myheight * 0.03),
                    DefaultTextField(
                      hintText: 'كلمة المرور',
                      label: "ادخل كلمة المرور",
                      icon: Icons.lock,
                      isPasswordField: true,
                      type: TextInputType.visiblePassword,
                      textController: passwordController,
                    ),

                    SizedBox(height: myheight * 0.05),
                    DefaultButton(
                      colored: true,
                      onClick: () async {
                        UsersRepoImpl usersRepoImpl = UsersRepoImpl();
                        int code = await usersRepoImpl.login(
                            username: emailController.text,
                            password: passwordController.text);
                        if (code == 200) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        }
                      },
                      text: 'تسجيل الدخول',
                    ),

                    SizedBox(height: myheight * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
