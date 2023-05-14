import 'package:flutter/material.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget({Key? key, required this.icon, required this.title, required this.description, this.onTap}) : super(key: key);
  final String  icon;
  final String  title;
  final String  description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(kItemPadding),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 36,
              height: 36,
            ),
            SizedBox(width: kDefaultPadding,),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(
                  title,

                ),
                SizedBox(height: kMinPadding,),
                Text(description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            )

          ],
        ),
      ),
    );
  }
}
