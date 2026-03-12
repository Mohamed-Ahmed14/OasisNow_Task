
String? checkValidInputs(String? emailText,String? passwordText,String? rePasswordText,){
  if(emailText == null ||  emailText.trim().isEmpty){
    return 'Email is required.';
  }else if(!emailText.contains('@')){
    return 'Enter a valid email.';
  }else if(passwordText==null || passwordText.trim().isEmpty){
    return 'Password is required.';
  }else if(rePasswordText == null || rePasswordText.trim().isEmpty){
    return 'Re-Password is required.';
  }else if(passwordText != rePasswordText){
    return 'Passwords did not match, try again.';
  }
  return null;
}