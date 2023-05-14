import 'package:flutter/material.dart';
import 'package:travel_app/constants/color_palette.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/helpers/image_helper.dart';
import 'package:travel_app/model/room_model.dart';
import 'package:travel_app/screens/main_app.dart';
import 'package:travel_app/widgets/app_bar_container.dart';
import 'package:travel_app/widgets/button_widget.dart';
import 'package:travel_app/widgets/item_room_booking_widget.dart';

class CheckOutScreen extends StatelessWidget {
   CheckOutScreen({Key? key, required this.roomModel}) : super(key: key);

  static const String routeName= "/check_out_screen";

  final RoomModel roomModel;

  List<String> listStep = [
    'Book and review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemStepCheckout(int step,String stepName, bool isEnd, bool isCheck){
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(
              kMediumPadding,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isCheck ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(width: kMinPadding,),
        Text(
          stepName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(width: kMinPadding,),
        if(!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if(!isEnd)
        SizedBox(width: kMinPadding,),

      ],
    );
  }

  Widget _buildItemOptionCheckout(String icon,String title,String value,BuildContext context){
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFormAsset(icon),
              SizedBox(width: kItemPadding,),
              Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
          SizedBox(height: kDefaultPadding,),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Text(value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColor,
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: "Check Out",
      imlementLeading: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              children: listStep.map((e) => _buildItemStepCheckout(listStep.indexOf(e)+1, e,
                  listStep.indexOf(e) == listStep.length -1,
                  listStep.indexOf(e) == 0)).toList(),
            ),
            SizedBox(height: kDefaultPadding,),
            ItemRoomBookingWidget(roomModel: roomModel,
                numberOfRoom: 1
            ),
            SizedBox(height: kDefaultPadding,),
            _buildItemOptionCheckout(AssetHelper.icoUser, "Contact detail", "Add Contact",context),
            SizedBox(height: kDefaultPadding,),
            _buildItemOptionCheckout(AssetHelper.icoPromo, "Promo code", "Add promo code",context),
            SizedBox(height: kDefaultPadding,),
            ButtonWidget(title: "Payment",
            onTap: (){
              Navigator.of(context).popUntil((route) => route.settings.name == MainApp.routeName);
            },
            ),
            SizedBox(height: kDefaultPadding,),
          ],
        ),

      ),
    );
  }
}
