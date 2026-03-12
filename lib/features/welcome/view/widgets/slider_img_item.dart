import 'package:flutter/material.dart';

class SliderImgItem extends StatelessWidget {
  final String imgPath;
  const SliderImgItem({required this.imgPath,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 121,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Image.asset(imgPath,fit: BoxFit.fill,
      ),
    );
  }
}
