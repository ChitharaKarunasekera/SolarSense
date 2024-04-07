import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/features/core/controllers/product_controller.dart';
import 'package:solarsense/src/features/core/models/products/inverter_model.dart';
import 'package:solarsense/src/features/core/models/products/panel_model.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/inverter_card_widget.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/solar_panel_card_widget.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/size.dart';
import '../../../../controllers/profile_controller.dart';
import '../../../../models/dashboard/top_selling_model.dart';
import '../../../../models/products/product_model.dart';

class PanelCardList extends StatelessWidget {
  const PanelCardList({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ProductController());

    return FutureBuilder(
      future: controller.getAllPanels(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          // The future is complete and has data, we can access it via snapshot.data.
          List<PanelModel> panelList = snapshot.data!;

          // String panelString = "List of panels: ";
          // for(var panel in panelList) {
          //   //print("Panel: ${panel.toString()}");
          //   panelString += "$panel, ";
          // }

          // print("\n${panelString}");

          return SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: panelList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                // onTap: () => yourOnTapFunctionHere(panelList[index]),
                child: SolarPanelCard(product: panelList[index], txtTheme: txtTheme),
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

