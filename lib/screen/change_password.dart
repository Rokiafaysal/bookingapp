import 'package:bookingapp/components/defaultTextField.dart';
import 'package:bookingapp/components/defultButton.dart';
import 'package:bookingapp/domain/repo_impl/user_repo/users_repo_impl.dart';
import 'package:bookingapp/main.dart';
import 'package:bookingapp/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

final passwordController = TextEditingController();

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextField(
                  hintText: 'كلمة المرور',
                  label: "ادخل كلمة المرور",
                  icon: Icons.lock,
                  isPasswordField: true,
                  type: TextInputType.visiblePassword,
                  textController: passwordController,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).width * 0.05),
                DefaultButton(
                  colored: true,
                  onClick: () async {
                    UsersRepoImpl usersRepoImpl = UsersRepoImpl();
                    await usersRepoImpl.editUser(
                        id: int.parse(MyApp.userId.toString()),
                        password: passwordController.text);
                    // ignore: use_build_context_synchronously
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ));
                  },
                  text: ' تغيير كلمة المرور',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
