import 'package:flutter/material.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/helpers/image_helper.dart';
import 'package:travel_app/helpers/local_storage_helper.dart';
import 'package:travel_app/screens/intro_screen.dart';
import 'package:travel_app/screens/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    final ignoreIntroScreen = LocalStorageHelper.getValue("ignoreIntroScreen" ) as bool?;
    await Future.delayed(Duration(milliseconds: 2000));
    if(ignoreIntroScreen != null && ignoreIntroScreen){
      Navigator.of(context).pushNamed(MainApp.routeName);
    }else{
      LocalStorageHelper.setValue("ignoreIntroScreen", true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFormAsset(
            AssetHelper.backgroundSplash,
            fit: BoxFit.fitWidth
          ),
        ),
        Positioned.fill(
          child: ImageHelper.loadFormAsset(
            AssetHelper.circleSplash,
            fit: BoxFit.fitWidth
          ),
        )
      ],
    );
  }
}
