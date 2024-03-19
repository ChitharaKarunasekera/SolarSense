import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/features/core/models/products/battery_model.dart';
import 'package:solarsense/src/features/core/models/products/inverter_model.dart';
import 'package:solarsense/src/features/core/models/products/panel_model.dart';
import 'package:solarsense/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_card_list.dart';

import '../../../../common_widgets/custom_shapes/circular_container.dart';
import '../../../../common_widgets/custom_widgets/playground_hader_widget.dart';
import '../../../../common_widgets/custom_widgets/solar_curved_edge_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/size.dart';
import '../dashboard/widgets/top_selling.dart';

class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Playground Header
            PlaygroundHeader(
              child: Column(
                children:[
                  /// Error Here: Content Does not SHOW
                  //DashboardAppbar()
                  Container(
                    width: 50,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.orange)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),

              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Solar Panels", style: txtTheme.bodyLarge),
                    ProductCardList(txtTheme: txtTheme),
                    const SizedBox(height: spaceBtwSections),
                    Text("Inverters", style: txtTheme.bodyLarge),
                    ProductCardList(txtTheme: txtTheme),
                    const SizedBox(height: spaceBtwSections),
                    Text("Batteries", style: txtTheme.bodyLarge),
                    ProductCardList(txtTheme: txtTheme),
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}



