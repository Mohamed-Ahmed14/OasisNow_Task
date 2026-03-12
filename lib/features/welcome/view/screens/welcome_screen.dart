import 'package:flutter/material.dart';

import '../../../../core/functions/validators.dart';
import '../../../../shared/widgets/custom_elevated_button.dart';
import '../../../../shared/widgets/custom_text.dart';
import '../widgets/already_have_account_widget.dart';
import '../widgets/error_msg_widget.dart';
import '../widgets/food_slider_section.dart';
import '../widgets/signup_form_section.dart';
import '../widgets/social_auth_section.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isSignupForm = false;
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  bool isAllInputValid = true;
  String? errorMsg;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsetsDirectional.symmetric(vertical: 16),
          children: [
            //Food Slider Section
            FoodSliderSection(),
            SizedBox(height: 32,),

            //Text
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xFFE4B679),
                    Color(0xFFFEE5C4),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));

              },
              child: CustomText(text: 'Welcome To OasisNow',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.0,
                letterSpacing: -0.9,
                color: Color(0xFFC2A788)),
            ),
            SizedBox(height: 16,),
            CustomText(text: 'The best cooking and the best care from our professional\n hands to your plate',
                  fontSize: 9,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  letterSpacing: 0.09,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            SizedBox(height: 32,),

            //Social Auth & Signup Form
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
              child: Column(
                children: [
                  AnimatedSwitcher(duration: Duration(milliseconds: 500),
                  child: isSignupForm?
                  SignupFormSection(key: ValueKey('Signup'),
                  signupKey: _signupFormKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  rePasswordController: _rePasswordController,):
                  SocialAuthSection(key: ValueKey('Social'),),
                  ),
                  SizedBox(height: 16,),

                  //Continue With OasisNow  Button Or Sign Up Button
                  Container(
                    decoration: BoxDecoration(
                      gradient: isSignupForm?LinearGradient(colors: [
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
                  AnimatedSwitcher(duration: Duration(milliseconds: 500),
                    child: isSignupForm?
                    ErrorMsgWidget(text: errorMsg,key: ValueKey('ErrorMsg'),):
                    AlreadyHaveAccountWidget(key: ValueKey('login'),),
                  ),
                  ]),
            ), //Already have account - Password didn't match
              ],

        ),
      ),
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
