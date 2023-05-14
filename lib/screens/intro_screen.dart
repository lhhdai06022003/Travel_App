
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/constants/textstyle_ext.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/helpers/image_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/screens/main_app.dart';
import 'package:travel_app/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController = StreamController<int>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }
  Widget _buildItemIntroScreen(String image,String title,String description,AlignmentGeometry alignment){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFormAsset(
            image,
            height: 414,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: kMediumPadding * 2,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(height: kMediumPadding),
              Text(
                description,
                style: TextStyles.defaultStyle.bold,
              ),
            ],
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                AssetHelper.slide1,
                'Book a flight',
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.centerRight,
              ),
              _buildItemIntroScreen(
                AssetHelper.slide2,
                'Find a hotel room',
                'Select the day, book your room. We give you the best price.',
                Alignment.center,
              ),
              _buildItemIntroScreen(
                AssetHelper.slide3,
                'Enjoy your trip',
                'Easy discovering new places and share these between your friends and travel together.',
                Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 0.5,
            child: Row(
              children: [
                Expanded(
                  flex:7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                ),
                 StreamBuilder<int>(
                   stream: _pageStreamController.stream,
                   initialData: 0,
                   builder: (context, snapshot) {
                     return Expanded(
                      flex: 3,
                      child: ButtonWidget(
                        onTap: (){
                          if(_pageController.page != 2){
                            _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                          }else{
                            Navigator.of(context).pushNamed(MainApp.routeName);
                          }
                        },
                        title: snapshot.data != 2 ? 'Next' : 'Get strated',
                      ),
                );
                   }
                 )
              ],
            ),
          )
        ],

      ),
    );
  }
}

