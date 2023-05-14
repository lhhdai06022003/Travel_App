import 'package:flutter/material.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/extension/date_ext.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/screens/hotels_screen.dart';
import 'package:travel_app/screens/select_date_screen.dart';
import 'package:travel_app/widgets/app_bar_container.dart';
import 'package:travel_app/widgets/button_widget.dart';
import 'package:travel_app/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelect;
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotels booking',
      imlementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: kMediumPadding * 2,),
            ItemBookingWidget(icon: AssetHelper.icoLocation,
                title: "Descriptioon",
                description: "South Korea",
                onTap: (){

                },
            ),
            SizedBox(height: kMediumPadding ),
            ItemBookingWidget(icon: AssetHelper.icoCalendal,
                title: "Select Date",
               description: dateSelect ?? "19April - 22April 2023",
               onTap: () async {
                  final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);

                  if(!(result as List<DateTime?>).any((element) => element == null)){
                    dateSelect = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(() {

                    });

                  }
               },
            ),
            SizedBox(height: kMediumPadding ),
            ItemBookingWidget(icon: AssetHelper.icoBed,
              title: "Guest and Room",
              description: "2Guest, 1Room",
              onTap: (){
                Navigator.of(context).pushNamed(GuestAndRoomBokingScreen.routeName);

              },
            ),
            SizedBox(height: kMediumPadding ),
            ButtonWidget(title: "Search",
            onTap: (){
              Navigator.of(context).pushNamed(HotelsScreen.routeName);
            },
            ),
          ],
        ),

      ),
    );
  }
}
