import 'package:flutter/material.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/model/room_model.dart';
import 'package:travel_app/screens/check_out_screen.dart';
import 'package:travel_app/widgets/app_bar_container.dart';
import 'package:travel_app/widgets/item_room_booking_widget.dart';
import 'package:travel_app/widgets/item_utility_hotel_widget.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({Key? key}) : super(key: key);

  static  String routeName = "/select_room_screen";



  @override
  Widget build(BuildContext context) {

    final List<RoomModel> listRoom = [
      RoomModel(
        roomImage: AssetHelper.room1,
        roomName: 'Deluxe Room',
        size: 27,
        utility: 'Free Cancellation',
        price: 245,
      ),
      RoomModel(
        roomImage: AssetHelper.room2,
        roomName: 'Executive Suite',
        size: 32,
        utility: 'Non-refundable',
        price: 289,
      ),
      RoomModel(
        roomImage: AssetHelper.room3,
        roomName: 'King Bed Only Room',
        size: 24,
        utility: 'Non-refundable',
        price: 214,
      ),
    ];
    return AppBarContainer(
      titleString: "Select room",
      imlementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: listRoom.map((e) => Padding(
            padding: EdgeInsets.only(bottom: kMediumPadding),
            child: ItemRoomBookingWidget(roomModel: e,
             numberOfRoom: 0,
                onTap: (){
               Navigator.of(context).pushNamed(CheckOutScreen.routeName,arguments: e);
                },),
          )).toList(),
        ),
      ),
    );
  }
}
