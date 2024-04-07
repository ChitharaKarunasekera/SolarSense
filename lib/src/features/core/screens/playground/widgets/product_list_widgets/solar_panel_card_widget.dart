import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solarsense/src/features/core/models/products/battery_model.dart';
import 'package:solarsense/src/features/core/models/products/inverter_model.dart';
import 'package:solarsense/src/features/core/models/products/panel_model.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/size.dart';
import '../../../../models/products/product_model.dart';

class SolarPanelCard extends StatelessWidget {
  const SolarPanelCard({
    super.key,
    required this.product,
    required this.txtTheme,
  });

  final PanelModel product;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 320,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 5),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: SolarSenseColors.primaryColor.withOpacity(0.1)),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${product.brand} Panels",
                            style: txtTheme.headline4,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Rs. ${product.cost}",
                            style: txtTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${product.warranty} Warranty",
                            style: txtTheme.bodyText2,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        child: Image(
                            image:
                            AssetImage(product.imageString),
                            height: 110)),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder()),
                      onPressed: () {},
                      child: const Icon(Iconsax.add),
                    ),
                    const SizedBox(width: solarSenseDashboardPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.wattage,  style: txtTheme.headline4, overflow: TextOverflow.ellipsis,),
                        Text(product.technology, style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}