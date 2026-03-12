import 'package:flutter/material.dart';
import 'package:oasis_now/features/welcome/view/widgets/social_signup_section.dart';
import '../../../../shared/widgets/custom_text.dart';
import '../widgets/food_slider_section.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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

            //Social Auth & Signup Form Section
            SocialSignupSection(),

              ],

        ),
      ),
    );
  }
}
