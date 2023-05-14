import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/constants/color_palette.dart';
import 'package:travel_app/constants/dimension_constants.dart';


class DashLineWidget extends StatelessWidget {
  const DashLineWidget({Key? key,  this.height=1,  this.color= ColorPalette.dividerColor}) : super(key: key);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context,BoxConstraints constraints) {

        final boxWidth = constraints.constrainWidth();
        const dashWidth = 6.0;
        final dashHeight = height;
        final dashCount =  (boxWidth / (2 * dashWidth)).floor();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(
              dashCount,
                (_){
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                );
                }
            ),

          ),
        );

      } ,
    ) ;
  }
}
