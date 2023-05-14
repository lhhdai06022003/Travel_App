import 'package:flutter/material.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/image_helper.dart';
import 'package:travel_app/model/room_model.dart';
import 'package:travel_app/widgets/button_widget.dart';
import 'package:travel_app/widgets/dashline_widget.dart';
import 'package:travel_app/widgets/item_utility_hotel_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget({Key? key, required this.roomModel, this.onTap, required this.numberOfRoom}) : super(key: key);


  final RoomModel roomModel;
  final Function()? onTap;
  final int numberOfRoom;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kItemPadding),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding,),
                    Text(
                      'Room Size: ${roomModel.size} m2',
                      maxLines: 2,
                    ),
                    SizedBox(height: kDefaultPadding,),
                    Text(
                      roomModel.utility,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFormAsset(
                  roomModel.roomImage,
                  radius: BorderRadius.circular(kItemPadding),
                ),
              ),

            ],
          ),
          ItemUtilityHotelScreen(),
          DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                    SizedBox(height: kMinPadding,),
                    Text(
                      '/night'
                    ),
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                child:numberOfRoom == null ?
                ButtonWidget(
                  title: 'Choose',
                  onTap: onTap,
                ) :
                Text("${numberOfRoom} room"),
              ),
            ],
          )

        ],
      ),
    );
  }
}
