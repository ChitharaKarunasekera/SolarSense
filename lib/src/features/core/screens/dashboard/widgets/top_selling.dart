import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/size.dart';
import '../../../models/dashboard/top_selling_model.dart';

class DashboardTopSelling extends StatelessWidget {
  const DashboardTopSelling({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {

    final list = DashboardTopSellingModel.list;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPressed,
          child: SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: SolarSenseColors.cardBgColor),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              list[index].productName,
                              style: txtTheme.headline4,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                              child: Image(
                                  image:
                                  AssetImage(list[index].imageString),
                                  height: 110)),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            onPressed: () {},
                            child: const Icon(Icons.arrow_forward),
                          ),
                          const SizedBox(width: solarSenseDashboardPadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list[index].efficiency,  style: txtTheme.headline4, overflow: TextOverflow.ellipsis,),
                              Text(list[index].technology, style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}