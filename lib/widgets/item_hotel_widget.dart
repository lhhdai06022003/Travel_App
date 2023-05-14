import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/constants/color_palette.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/helpers/image_helper.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/screens/hotel_detail_screen.dart';
import 'package:travel_app/widgets/button_widget.dart';
import 'package:travel_app/widgets/dashline_widget.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({Key? key, required this.hotelModel}) : super(key: key);

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFormAsset(
              hotelModel.hotelImage,
              radius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding),
                bottomRight: Radius.circular(kDefaultPadding),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: kDefaultPadding,),
                Row(
                  children: [
                    ImageHelper.loadFormAsset(
                      AssetHelper.icoLocationBlank,
                    ),
                    SizedBox(width: kMinPadding,),
                    Text(
                      hotelModel.location,
                    ),
                    Text(
                      '- ${hotelModel.awayKilometer} form destination',
                      style: TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: kDefaultPadding,),
                Row(
                  children: [
                    ImageHelper.loadFormAsset(
                      AssetHelper.icoStar,
                    ),
                    SizedBox(width: kMinPadding,),
                    Text(
                      hotelModel.star.toString(),
                    ),
                    Text(
                      '- ${hotelModel.numberOfReview} reviews',
                      style: TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                    )
                  ],
                ),
                DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${hotelModel.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: kMinPadding,),
                            Text(
                              '/night',
                            )
                          ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Book a room',
                        onTap: (){
                          Navigator.of(context).pushNamed(HotelDetailScreen.routeName,
                          arguments: hotelModel);
                        },
                      ),
                    )
                  ],
                )

              ],
            ),
          )
        ],
      ),

    );
  }
}
