import 'package:book_store/screens/home_screen.dart';
import 'package:book_store/screens/login_screen.dart';
import 'package:book_store/shared/shared_color.dart';
import 'package:book_store/shared/shared_widgets/custom_button.dart';
import 'package:book_store/shared/shared_widgets/custom_form_field.dart';
import 'package:book_store/shared/shared_widgets/custom_social_button.dart';
import 'package:book_store/shared/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                SvgPicture.asset('assets/svg/home2.svg', height: 300),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: 'Welcome,', fontSize: 30),
                      CustomText(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          text: 'Sign In',
                          fontSize: 18,
                          color: SharedColors.darkPrimaryColor)
                    ]),
                const SizedBox(height: 10),
                const CustomText(
                    text: 'Sign Up to Continue',
                    fontSize: 14,
                    color: Colors.grey),
                const SizedBox(height: 30),
                CustomTextFormField(
                    text: 'Email',
                    hint: 'asmaaahmed@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String? value) {},
                    validator: (String? value) {}),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    text: 'Password',
                    hint: 'password',
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (String? value) {},
                    validator: (String? value) {}),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                    onTap: () {},
                    text: 'Forget Password?',
                    fontSize: 14,
                    alignment: Alignment.topRight),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  text: 'SIGN UP',
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: '- OR -',
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomSocialButton(
                  onPressed: () {},
                  text: 'Sign Up with Facebook',
                  assetName: 'assets/images/Facebook.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSocialButton(
                  onPressed: () {},
                  text: 'Sign Up with Google',
                  assetName: 'assets/images/google.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
