import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/colors_constants.dart';
import 'package:shopify/widgets/headline.widget.dart';

class NotificatonPage extends StatefulWidget {
  const NotificatonPage({super.key});

  @override
  State<NotificatonPage> createState() => _NotificatonPageState();
}

class _NotificatonPageState extends State<NotificatonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsConstants.bgColor,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: ColorsConstants.badgeColor,
                  size: 35,
                ))
          ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const HeadlineWidget(title: 'NotifiCations'),
            SizedBox(height: 15,),
            ListView.separated(
                separatorBuilder: (context, index) {
                  return  Padding(
                    padding:  EdgeInsets.only(left:70.0,right: 15),
                    child: Divider(
                      color: ColorsConstants.greyTxtColor,
                    ),
                  );
                },
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      child: Image.asset("assets/images/notif_icon.png"),
                    ),
                    title: Text("50% off of everything ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: ColorsConstants.greyTxtColor,
                        )),
                    trailing: Text("Yesterday",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff515c6f),
                        )),
                  );
                })
          ],
        ),
      )),
    );
  }
}
