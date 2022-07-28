import 'package:flutter/material.dart';

class ClickableWidget extends StatelessWidget {
   ClickableWidget({Key? key,this.text, this.onTap,this.iconData}) : super(key: key);

  String? text;
IconData? iconData;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
        decoration: BoxDecoration(

          color: Colors.grey.shade200,
          borderRadius: BorderRadius.all(Radius.circular(15)),

        ),
        child: Row(
          children: [
            Text(text!,style: TextStyle(fontSize: 18,color: Colors.grey.shade400),),
            const Spacer(),
            Icon(iconData,color: Colors.grey.shade400,)
          ],
        ),
      ),
    );
  }
}
