import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';
import 'package:mymoney/utils/imagenames.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: white,
      child: Padding(
        padding:
            EdgeInsets.only(top: Get.height / 9.48, left: Get.width / 10.28),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 35,
              backgroundImage: AssetImage(personImage),
              backgroundColor: white,
            ),
            SizedBox(
              height: Get.height / 59.42,
            ),
            Container(
              width: Get.width / 4.57,
              height: Get.height / 12.73,
              child: Text(
                "Mattie Hardwick",
                style: TextStyle(
                  fontSize: 19,
                  color: black0D1F3C,
                  fontFamily: "TitilliumWebSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            /* SizedBox(
              height: 10
            ),*/
            Padding(
              padding: EdgeInsets.only(left: Get.width / 3.29),
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: drawerList.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: drawerList[index]["onTap"],
                    leading: SvgPicture.asset(
                      drawerList[index]["img"],
                      height: Get.height / 44.571,
                    ),
                    minLeadingWidth: Get.width / 20.57,
                    title: Text(
                      drawerList[index]["title"],
                      style: TextStyle(
                        fontSize: Get.width / 21.65,
                        color: black0D1F3C,
                        fontFamily: "NunitoSemiBold",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
