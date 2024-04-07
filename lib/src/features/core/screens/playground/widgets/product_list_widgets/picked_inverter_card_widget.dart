import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solarsense/src/features/core/models/products/battery_model.dart';
import 'package:solarsense/src/features/core/models/products/inverter_model.dart';
import 'package:solarsense/src/features/core/models/products/panel_model.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/size.dart';
import '../../../../models/products/product_model.dart';

class PickedInverterCard extends StatelessWidget {
  const PickedInverterCard({
    super.key,
    required this.product,
    required this.txtTheme,
  });

  final InverterModel product;
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
                color: Colors.lightGreenAccent.withOpacity(0.1)),
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
                            "${product.brand} ${product.productName}",
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
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image(
                          image: AssetImage(product.imageString),
                          height: 110,
                        ),
                        // Badge widget here
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: SolarSenseColors.darkColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 28,
                              minHeight: 28,
                            ),
                            child: const Text(
                              '1', // Assuming you have a quantity field in your product model
                              style: TextStyle(
                                color: SolarSenseColors.whiteColor,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(shape: const CircleBorder()),
                      onPressed: () {},
                      child: const Icon(Iconsax.add),
                    ),
                    const SizedBox(width: solarSenseDashboardPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.capacity,
                          style: txtTheme.headline4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("${product.efficiency} Efficiency",
                            style: txtTheme.titleMedium,
                            overflow: TextOverflow.ellipsis),
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
