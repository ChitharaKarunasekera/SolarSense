import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/analysis/analyse_statistics.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/picked_compnents_section_widget.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/inverter_card_list.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/panel_card_list.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/picked_equipment_card_list.dart';

import '../../controllers/myplan_controller.dart';
import '../../models/myplan_model.dart';
import 'widgets/header_widgets/playground_hader_widget.dart';
import '../../../../constants/size.dart';

class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final myPlanController = Get.put(MyPlanController());
    final analyzeStatistics = Get.put(AnalyzeStatistics());
    String productRecommendation = "";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Playground Header
            PlaygroundHeader(
              child: Column(
                children:[
                  Container(
                    width: 50,
                    padding: const EdgeInsets.all(0),
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
                    ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                    // Display the generated content
                    Text("Picked Components", style: txtTheme.bodyLarge),
                    PickedComponentsSection(txtTheme: txtTheme),
                    const SizedBox(height: 5),
                    const Divider(),
                    /// Other available products


                    const SizedBox(height: spaceBtwSections),

                    Text("Solar Panels", style: txtTheme.bodyLarge),
                    PanelCardList(txtTheme: txtTheme),
                    const SizedBox(height: spaceBtwSections),
                    Text("Inverters", style: txtTheme.bodyLarge),
                    InverterCardList(txtTheme: txtTheme),
                    const SizedBox(height: spaceBtwSections),
                    // Text("Batteries", style: txtTheme.bodyLarge),
                    // ProductCardList(txtTheme: txtTheme),



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



