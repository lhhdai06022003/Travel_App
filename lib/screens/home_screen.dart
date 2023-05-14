import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/constants/color_palette.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/helpers/image_helper.dart';
import 'package:travel_app/screens/hotel_booking_screen.dart';
import 'package:travel_app/screens/hotels_screen.dart';
import 'package:travel_app/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildItemCategory (Widget icon,Color color, Function() onTap, String  title){
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: kMediumPadding),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding),
            ),
            child: icon,
          ),
          SizedBox(height: kItemPadding,),
          Text(title),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContextcontext) {
    return AppBarContainer(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                Text(
                  "Hi Dai !",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                SizedBox(height: kMediumPadding,),
                Text(
                  "Where are you ging next ?",
                  style: TextStyle(
                      fontSize: 14,
                    color: ColorPalette.subTitleColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(width: kTopPadding,),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  kItemPadding,
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(kMinPadding),
              child: ImageHelper.loadFormAsset(
                AssetHelper.user,
              ),
            ),
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration:InputDecoration(
              hintText: "Search your destination",
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kMediumPadding,
                ),
              ),
              filled: true,
                fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
            ),
          ),
          SizedBox(height: kDefaultPadding,),
          Row(
              children: [
                Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFormAsset(
                          AssetHelper.icoHotel,
                        width: kBottomBarIconSize,
                        height: kBottomBarIconSize,
                      ),
                      Color(0xffFE9C5E),
                          () => {
                        Navigator.of(context).pushNamed(HotelBookingScreen.routeName),
                          },
                      "Hotels"
                  ),
                ),
                SizedBox(width: kDefaultPadding,),
                Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFormAsset(
                          AssetHelper.icoPlane,
                        width: kBottomBarIconSize,
                        height: kBottomBarIconSize,
                      ),
                      Color(0xffF7777),
                          () => {
                        Navigator.of(context).pushNamed(HotelsScreen.routeName),
                          },
                      "Flights"
                  ),
                ),
                SizedBox(width: kDefaultPadding,),
                Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFormAsset(
                          AssetHelper.icoHotelPlane,
                        width: kBottomBarIconSize,
                        height: kBottomBarIconSize,
                      ),
                      Color(0xff3EC8BC),
                          () => {},
                      "All"
                  ),
                ),
              ],
          ),
        ],
      ),
    );
  }
}
