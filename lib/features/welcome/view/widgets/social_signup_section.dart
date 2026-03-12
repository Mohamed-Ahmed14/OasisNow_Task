import 'package:flutter/material.dart';
import 'package:oasis_now/features/welcome/view/widgets/signup_form_widget.dart';
import 'package:oasis_now/features/welcome/view/widgets/social_auth_widget.dart';

import '../../../../core/functions/validators.dart';
import '../../../../shared/widgets/custom_elevated_button.dart';
import '../../../../shared/widgets/custom_text.dart';
import 'already_have_account_widget.dart';
import 'error_msg_widget.dart';

class SocialSignupSection extends StatefulWidget {

  const SocialSignupSection({super.key});

  @override
  State<SocialSignupSection> createState() => _SocialSignupSectionState();
}

class _SocialSignupSectionState extends State<SocialSignupSection> {

  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  String? errorMsg;
  bool isSignupForm = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
      child: Column(
          children: [
            AnimatedSwitcher(duration: Duration(milliseconds: 300),
              child: isSignupForm?
              SignupFormWidget(key: ValueKey('Signup'),
                signupKey: _signupFormKey,
                emailController: _emailController,
                passwordController: _passwordController,
                rePasswordController: _rePasswordController,):
              SocialAuthWidget(key: ValueKey('Social'),),
            ),
            SizedBox(height: 16,),

            //Continue With OasisNow  Button Or Sign Up Button
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                gradient:isSignupForm?LinearGradient(colors: [
                  Color(0xFFE4B679),
                  Color(0xFFFEE5C4),
                ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ):null,
                color: Color(0xFF323232),
                borderRadius: BorderRadius.circular(16),

              ),
              child: CustomElevatedButton(
                backgroundColor: Colors.transparent,
                withBorder: false,
                onPressed: (){
                  if(isSignupForm == true){
                    //check email & password validators
                    if(_signupFormKey.currentState!.validate()){
                      errorMsg = checkValidInputs(
                          _emailController.text,
                          _passwordController.text,
                          _rePasswordController.text
                      );
                      setState(() {

                      });
                    }
                  }else{
                    isSignupForm = true;
                    setState(() {
                    });
                  }

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isSignupForm?
                    CustomText(text: 'Sign Up',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      letterSpacing: -0.36,):
                    CustomText(text: 'Continue with OasisNow',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.1,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),

            //Already have account or Validation messages
            AnimatedSwitcher(duration: Duration(milliseconds: 300),
              child: isSignupForm?
              ErrorMsgWidget(text: errorMsg,key: ValueKey('ErrorMsg'),):
              AlreadyHaveAccountWidget(key: ValueKey('login'),),
            ),
          ]),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }
}
