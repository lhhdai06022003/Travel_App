import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/constants/dimension_constants.dart';
import 'package:travel_app/helpers/asset_helper.dart';
import 'package:travel_app/helpers/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  const ItemAddGuestAndRoom({Key? key, required this.title, required this.icon, required this.innitData}) : super(key: key);

  final String title;
  final String icon;
  final int innitData;
  @override
  State<ItemAddGuestAndRoom> createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number = widget.innitData;
    _textEditingController = TextEditingController(text: widget.innitData.toString())
    ..addListener(() {
      number = int.parse(_textEditingController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kTopPadding),
          color: Colors.white
        ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: EdgeInsets.all(kMediumPadding),
      child: Row(
        children: [
          ImageHelper.loadFormAsset(
            widget.icon,
          ),
          SizedBox(width: kDefaultPadding,),
          Text(widget.title),
          Spacer(),
          GestureDetector(
            onTap: (){
              if(number > 1){
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if(_focusNode.hasFocus){
                    _focusNode.unfocus();
                  }
                });

              }
            },
            child: ImageHelper.loadFormAsset(
              AssetHelper.icoDecre,
            ),
          ),
          Container(
            height: 35,
            width: 60,
            padding: EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 18),
              ),
              onChanged: (value){},
              onSubmitted: (String submitValue){},
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                number++;

              });
              _textEditingController.text = number.toString();
              if(_focusNode.hasFocus){
                _focusNode.unfocus();
              }
            },
            child: ImageHelper.loadFormAsset(
              AssetHelper.icoIncre,
            ),
          ),
        ],
      ),
    );
  }
}
