import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_text_form_field.dart';

class SignupFormWidget extends StatefulWidget {
  final GlobalKey<FormState> signupKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  const SignupFormWidget({
    required this.signupKey,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    super.key});


  @override
  State<SignupFormWidget> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormWidget> {

  final FocusNode _emailFocusNode =  FocusNode();
  final FocusNode _passwordFocusNode =  FocusNode();
  final FocusNode _rePasswordFocusNode =  FocusNode();
  @override
  Widget build(BuildContext context) {


    return Form(
      key: widget.signupKey,
        child: Column(
      children: [
        CustomTextFormField(
          controller: widget.emailController,
          hintText: 'Email',
          focusNode: _emailFocusNode,
        ),
        SizedBox(height: 8,),
        CustomTextFormField(
          controller: widget.passwordController,
          hintText: 'Password',
          focusNode: _passwordFocusNode,
          suffixIcon: IconButton(onPressed: (){},
              icon: CircleAvatar(
                radius: 13.5,
                backgroundColor: Color(0xFFBABABA).withValues(alpha: 0.1),
                child: Icon(Icons.visibility_rounded,size: 11,color: Colors.white.withValues(alpha: 0.4),),
              )),
        ),
        SizedBox(height: 8,),
        CustomTextFormField(
          controller: widget.rePasswordController,
          hintText: 'Re-enter Password',
          focusNode: _rePasswordFocusNode,
          suffixIcon: IconButton(onPressed: (){},
              icon: CircleAvatar(
                radius: 13.5,
                backgroundColor: Color(0xFFBABABA).withValues(alpha: 0.1),
                child: Icon(Icons.visibility_rounded,size: 11,color: Colors.white.withValues(alpha: 0.4),),
              )),
        ),
      ],
    ));
  }

}
