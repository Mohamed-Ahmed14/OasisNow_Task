import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_elevated_button.dart';
import '../../../../shared/widgets/custom_text.dart';

class SocialAuthWidget extends StatelessWidget {
  const SocialAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16,),
        //Login With Apple
        CustomElevatedButton(
          backgroundColor:  Colors.transparent,
          withBorder: true,
          onPressed: (){},
          child: Row(
            children: [
              Image.asset('assets/images/apple.png',width: 15,height: 15,),
              Expanded(
                child: CustomText(text: 'Continue with Apple',
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.1,),
              )
            ],
          ),
        ),
        SizedBox(height: 16,),
        //Login With Google
        CustomElevatedButton(
          backgroundColor:  Colors.transparent,
          withBorder: true,
          onPressed: (){},
          child: Row(
            children: [
              Image.asset('assets/images/google.png',width: 15,height: 15,),
              Expanded(
                child: CustomText(text: 'Continue with Google',
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.1,),
              )
            ],
          ),
        ),
        SizedBox(height: 16,),
        //Or Divider
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Color(0xFFD9D9D9),
                thickness: 1,
              ),
            ),
            SizedBox(width: 8,),
            CustomText(text: 'or',
              color: Color(0xFFAAAAAA),
              fontWeight: FontWeight.w700,
              height: 1,
              fontSize: 9,
              letterSpacing: -0.27,),
            SizedBox(width: 8,),
            Expanded(
              child: Divider(
                color: Color(0xFFD9D9D9),
              ),
            ),
          ],
        ),


      ],
    );
  }
}
