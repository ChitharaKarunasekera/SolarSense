import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/size.dart';
import '../../../models/dashboard/categories_model.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) => GestureDetector(
          onTap: list[index].onPressed,
          child: SizedBox(
              width: 170,
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: SolarSenseColors.darkColor),
                      child: Center(
                        child: Text(list[index].title,
                            style: txtTheme.headline6
                                ?.apply(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(list[index].heading,
                            style: txtTheme.subtitle2,
                            overflow: TextOverflow.ellipsis),
                        // add dots if text is too long
                        Text(list[index].subHeading,
                            style: txtTheme.bodyText2,
                            overflow: TextOverflow.ellipsis)
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}