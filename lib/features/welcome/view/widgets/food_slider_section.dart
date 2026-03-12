import 'package:flutter/material.dart';
import 'package:oasis_now/features/welcome/view/widgets/slider_img_item.dart';


class FoodSliderSection extends StatefulWidget {
  const FoodSliderSection({super.key});

  @override
  State<FoodSliderSection> createState() => _FoodSliderSectionState();
}

class _FoodSliderSectionState extends State<FoodSliderSection> {

  final ScrollController _scrollControllerRTL = ScrollController();
  final ScrollController _scrollControllerLTR = ScrollController();
  final imagesList = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrollingRTL();
      _startScrollingLTR();
    });
  }



  void _startScrollingRTL() {

    //RTL Scrolling
    if (_scrollControllerRTL.hasClients) {
      _scrollControllerRTL.animateTo(
        _scrollControllerRTL.offset + 300,
        duration: const Duration(seconds: 10),
        curve: Curves.linear,
      ).then((_) {
        //when reach the destination start again
        if (mounted) {
          _startScrollingRTL();
        }
      });
    }
  }

  void _startScrollingLTR(){
    //LTR Scrolling
    if (_scrollControllerLTR.hasClients) {
      _scrollControllerLTR.animateTo(
        _scrollControllerLTR.offset + 300,
        duration: const Duration(seconds: 10),
        curve: Curves.linear,
      ).then((_) {
        //when reach the destination start again
        if (mounted) {
          _startScrollingLTR();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 121,
          child: ListView.builder(
            controller: _scrollControllerRTL,
            scrollDirection: Axis.horizontal,
            reverse: true,
            physics: const NeverScrollableScrollPhysics(), //

            itemBuilder: (context, index) {
              final int actualIndex =  index % imagesList.length;
              return SliderImgItem(imgPath: imagesList[actualIndex],);
            },),
        ),
        SizedBox(height: 16,),
        SizedBox(
          height: 121,
          child: ListView.builder(
            controller: _scrollControllerLTR,
            scrollDirection: Axis.horizontal,
            reverse: false,
            physics: const NeverScrollableScrollPhysics(), //

            itemBuilder: (context, index) {
              final int actualIndex =  index % imagesList.length;
              return SliderImgItem(imgPath: imagesList[actualIndex],);
            },),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollControllerRTL.dispose();
    _scrollControllerLTR.dispose();
    super.dispose();
  }
}
