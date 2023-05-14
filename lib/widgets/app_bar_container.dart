import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/constants/color_palette.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/helpers/image_helper.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({Key? key,required this.child, this.title, this.titleString, this.imlementLeading = false, this.imlementTraling = false}) : super(key: key);

  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool imlementLeading;
  final bool imlementTraling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ?? Row(
                children: [
                  if(imlementLeading)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kDefaultPadding),
                        ),
                        color: Colors.white
                      ),
                      padding: EdgeInsets.all(kItemPadding),
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                        size: kDefaultIconSize,
                      ),
                    ),
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            titleString ?? '',

                          ),
                        ],
                      ),
                    ),
                  ),

                  if(imlementTraling)
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kDefaultPadding),
                          ),
                          color: Colors.white
                      ),
                      padding: EdgeInsets.all(kItemPadding),
                      child: Icon(
                        FontAwesomeIcons.bars,
                        color: Colors.black,
                        size: kDefaultIconSize,
                      ),
                    ),

                ],
              ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child,
          )
        ],
      ),
    );
  }
}
