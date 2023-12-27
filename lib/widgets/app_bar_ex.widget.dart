import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/utils/constants/colors_constants.dart';

import '../providers/app_auth_provider.dart';

class AppBarEx {
  static PreferredSizeWidget  getAppBar(BuildContext context) => AppBar(
        backgroundColor: ColorsConstants.bgColor,

    elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/Messages.png',)

                  ),
              Positioned(
                  bottom:10,
                  child: Badge(
                    backgroundColor: ColorsConstants.badgeColor,
                    label:const Text('5'),
                  ))
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<AppAuthProvider>(context, listen: false).onLogout(context);
                },
                icon: Icon(
                  Icons.notifications_outlined,
                  color: ColorsConstants.iconColor,
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: Badge(
                    backgroundColor: ColorsConstants.badgeColor,
                    label: const Text('5'),
                  ))
            ],
          ),
        ],
      );


}

