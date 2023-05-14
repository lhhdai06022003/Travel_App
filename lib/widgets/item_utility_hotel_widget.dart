import 'package:flutter/material.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/helpers/image_helper.dart';


class ItemUtilityHotelScreen extends StatelessWidget {
   ItemUtilityHotelScreen({Key? key}) : super(key: key);

  final List<Map<String,String>> listUtility = [
    {
      "icon":AssetHelper.icoWifi,
      "name":"Free\nWifi",
    },
    {
      "icon":AssetHelper.icoNonRefund,
      "name":"Non\nRefundable",
    },
    {
      "icon":AssetHelper.icoBreakfast,
      "name":"Free\nBreakfast",
    },
    {
      "icon":AssetHelper.icoNonSmoke,
      "name":"Non\nSmoking",
    },
  ];

  Widget _buildItemUtilityHotelScreen(String icon,String title){
    return Column(
      children: [
        ImageHelper.loadFormAsset(icon),
        SizedBox(height: kTopPadding,),
        Text(title,
        textAlign: TextAlign.center,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtility.map((e) => _buildItemUtilityHotelScreen(e['icon']!, e['name']!)).toList(),
      ),
    );
  }
}
