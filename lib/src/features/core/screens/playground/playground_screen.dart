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
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final MyPlanController myPlanController = Get.put(MyPlanController());

    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<MyPlanModel>(
          future: myPlanController.getMyPlanData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                MyPlanModel myPlan = snapshot.data!;
                // Use myPlan as needed, e.g., pass to PlaygroundHeader
                return buildContent(context, txtTheme, myPlan);
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
            }
            // Default loading state
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context, TextTheme txtTheme, MyPlanModel myPlan) {
    return Column(
      children: [
        PlaygroundHeader(
          // Assuming PlaygroundHeader can take MyPlanModel or its properties
          // Adjust according to your actual implementation
          myPlanModel: myPlan,
          child: Column(
            children: [
              Container(
                width: 50,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.orange)),
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
                    Text("Picked Components", style: txtTheme.bodyLarge),
                    PickedComponentsSection(txtTheme: txtTheme),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: spaceBtwSections),
                    Text("Solar Panels", style: txtTheme.bodyLarge),
                    PanelCardList(txtTheme: txtTheme),
                    const SizedBox(height: spaceBtwSections),
                    Text("Inverters", style: txtTheme.bodyLarge),
                    InverterCardList(txtTheme: txtTheme),
                  ],
                ))),
      ],
    );
  }
}



