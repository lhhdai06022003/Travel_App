
import 'package:flutter/material.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/model/room_model.dart';
import 'package:travel_app/screens/check_out_screen.dart';
import 'package:travel_app/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/screens/hotel_detail_screen.dart';
import 'package:travel_app/screens/hotels_screen.dart';
import 'package:travel_app/screens/intro_screen.dart';
import 'package:travel_app/screens/main_app.dart';
import 'package:travel_app/screens/select_date_screen.dart';
import 'package:travel_app/screens/select_room_screen.dart';
 import 'package:travel_app/screens/splash_screen.dart';
import 'package:travel_app/screens/hotel_booking_screen.dart';

 final Map<String,WidgetBuilder> routes = {
   SplashScreen.routeName: ( context) => const SplashScreen(),
   IntroScreen.routeName: ( context) => const IntroScreen(),
   MainApp.routeName: ( context) => const MainApp(),
   HotelsScreen.routeName: ( context) => const HotelsScreen(),
   HotelBookingScreen.routeName: ( context) => const HotelBookingScreen(),
   SelectDateScreen.routeName: ( context) =>  SelectDateScreen(),
   GuestAndRoomBokingScreen.routeName: ( context) =>  GuestAndRoomBokingScreen(),
   SelectRoomScreen.routeName: ( context) =>  SelectRoomScreen(),
 };

 MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings){
   switch(settings.name){
     case HotelDetailScreen.routeName:
       return MaterialPageRoute(builder: (context){
         final HotelModel hotelModel = (settings.arguments as HotelModel);
         return HotelDetailScreen(hotelModel: hotelModel);
       });
     case CheckOutScreen.routeName:
       return MaterialPageRoute(builder: (context){
         final RoomModel roomModel = (settings.arguments as RoomModel);
         return CheckOutScreen(roomModel: roomModel);
       });
   }
 }

