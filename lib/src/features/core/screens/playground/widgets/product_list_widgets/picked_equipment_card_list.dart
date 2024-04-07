import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/features/core/controllers/product_controller.dart';
import 'package:solarsense/src/features/core/models/products/inverter_model.dart';
import 'package:solarsense/src/features/core/models/products/panel_model.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/inverter_card_widget.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/picked_inverter_card_widget.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/picked_panel_card_widget.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/solar_panel_card_widget.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/size.dart';
import '../../../../controllers/profile_controller.dart';
import '../../../../models/dashboard/top_selling_model.dart';
import '../../../../models/products/product_model.dart';

class PickedEquipmentCardList extends StatelessWidget {
  const PickedEquipmentCardList({
    super.key,
    required this.recommendation,
    required this.txtTheme,
  });

  final String recommendation;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ProductController());

    List<String> splitRecommendation = recommendation.split(',');
    print("Generated recommendation =  $splitRecommendation");

    print("Split Data: $splitRecommendation");
    final String panelID = splitRecommendation[0].substring(splitRecommendation[0].indexOf(':') + 2);
    print("panelID = ...$panelID...");
    final String inverterID = splitRecommendation[1].substring(splitRecommendation[1].indexOf(':') + 2);
    print("inverterID = ...$inverterID...");
    final String noOfPanels = splitRecommendation[2].substring(splitRecommendation[2].indexOf(':') + 2);
    print("noOfPanels = $noOfPanels");

    return FutureBuilder(
      future: controller.getPickedProducts(inverterID, panelID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          // The future is complete and has data, we can access it via snapshot.data.
          List<ProductModel> equipmentList = snapshot.data!;

          // String panelString = "List of panels: ";
          // for(var panel in panelList) {
          //   //print("Panel: ${panel.toString()}");
          //   panelString += "$panel, ";
          // }

          // print("\n${panelString}");

          print("Equipment List: $equipmentList");

          return SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: equipmentList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                // onTap: () => yourOnTapFunctionHere(panelList[index]),

                child: equipmentList[index] is PanelModel
                    ? PickedPanelCard(product: equipmentList[index] as PanelModel, panelCount: noOfPanels, txtTheme: txtTheme)
                    : PickedInverterCard(product: equipmentList[index] as InverterModel, txtTheme: txtTheme),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // If the future completed with an error, display it.
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          // While the future is not complete, show a loading indicator.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}

