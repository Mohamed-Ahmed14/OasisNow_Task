import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_text.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: 'Already have an account',
            fontSize: 9,
            fontWeight: FontWeight.w700,
            height: 1,
            letterSpacing: -0.27,
            color: Color(0xFFAAAAAA),),
          SizedBox(width: 8,),
          InkWell(
            onTap: (){},
            child: ShaderMask(
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
              child: CustomText(text: 'Login',
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  letterSpacing: 0.09,
                  color: Color(0xFFC2A788)),
            ),
          ),
        ]
    );
  }
}
