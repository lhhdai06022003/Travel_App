import 'package:flutter/material.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/widgets/app_bar_container.dart';
import 'package:travel_app/widgets/button_widget.dart';
import 'package:travel_app/widgets/item_add_guest_and_room.dart';

class GuestAndRoomBokingScreen extends StatefulWidget {


const GuestAndRoomBokingScreen({Key? key}) : super(key: key);
  static const String routeName = "/guest_and_room_booking_screen";

  @override
  State<GuestAndRoomBokingScreen> createState() => _GuestAndRoomBokingScreenState();
}

class _GuestAndRoomBokingScreenState extends State<GuestAndRoomBokingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: "Add Guest And Room",
      child: Column(
        children:  [
          SizedBox(height: kMediumPadding*1.5,),
          ItemAddGuestAndRoom(title: "Guest",
              icon: AssetHelper.icoGuest,
              innitData: 2
          ),
          ItemAddGuestAndRoom(title: "Guest",
              icon: AssetHelper.icoRoom,
              innitData: 2
          ),
          ButtonWidget(
            title: "Select",
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(
            title: "Cancle",
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
