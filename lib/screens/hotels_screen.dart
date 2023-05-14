import 'package:flutter/material.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/widgets/app_bar_container.dart';
import 'package:travel_app/widgets/item_hotel_widget.dart';

class HotelsScreen extends StatefulWidget {
 const HotelsScreen({Key? key}) : super(key: key);

  static String routeName = '/hotels_screen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {

  final List<HotelModel> listHote =[
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numberOfReview: 3241,
      price: 143,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      star: 4.2,
      numberOfReview: 3241,
      price: 234,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      star: 3.8,
      numberOfReview: 1234,
      price: 132,
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: "Hotels",
      imlementTraling: true,
      imlementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: listHote.map((e) => ItemHotelWidget(hotelModel: e)).toList(),

        ),
      ),

    );
  }
}
