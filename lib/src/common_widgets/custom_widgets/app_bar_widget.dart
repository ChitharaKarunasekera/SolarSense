import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class SolarSenseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SolarSenseAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(solarSenseAppName,
          style: Theme.of(context).textTheme.headline4),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: const Icon(Icons.menu, color: Colors.black),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // //For Dark Color
            // color: isDark ? tSecondaryColor : tCardBgColor,
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(image: AssetImage(userProfileImage))),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}