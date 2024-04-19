import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/features/core/models/plaground_stats_model.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/picked_equipment_card_list.dart';

import '../../../../../constants/colors.dart';
import '../../../controllers/myplan_controller.dart';
import '../../../models/myplan_model.dart';
import 'analysis/analyse_statistics.dart';

class PickedComponentsSection extends StatefulWidget {
  final TextTheme txtTheme;

  const PickedComponentsSection({Key? key, required this.txtTheme})
      : super(key: key);

  @override
  _PickedComponentsSectionState createState() =>
      _PickedComponentsSectionState();
}

class _PickedComponentsSectionState extends State<PickedComponentsSection> {
  bool _isButtonPressed = false;
  String? productRecommendation;



  @override
  Widget build(BuildContext context) {
    final myPlanController = Get.put(MyPlanController());
    final analyzeStatistics = Get.put(AnalyzeStatistics());

    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Picked Components", style: widget.txtTheme.bodyLarge),
        if (!_isButtonPressed)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isButtonPressed = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: SolarSenseColors.primaryColor, side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text('Get Recommendations', style: TextStyle(color: SolarSenseColors.darkColor)),
                ),
              ),
            ),
          )
        else
          FutureBuilder<MyPlanModel>(
            future: myPlanController.getMyPlanData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final MyPlanModel myPlan = snapshot.data!;
                  return FutureBuilder<String>(
                    future: AnalyzeStatistics.instance
                        .fetchRecommendedEquipment(myPlan.annualProduction,
                            myPlan.inverterCapacity, myPlan.panelOutputWattage),
                    builder: (context, innerSnapshot) {
                      if (innerSnapshot.connectionState ==
                          ConnectionState.done) {
                        if (innerSnapshot.hasData) {
                          productRecommendation = innerSnapshot.data!;
                          print(
                              "Product Recommendation: $productRecommendation");


                          String? email = myPlan.email;

                          return PickedEquipmentCardList(
                              email: email,
                              recommendation: productRecommendation!,
                              txtTheme: widget.txtTheme);
                        } else if (innerSnapshot.hasError) {
                          return Text('Error: ${innerSnapshot.error}');
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          // Set the color of the CircularProgressIndicator
                          valueColor: AlwaysStoppedAnimation<Color>(SolarSenseColors.primaryColor),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
              }
              return const Center(
                child: CircularProgressIndicator(
                  // Set the color of the CircularProgressIndicator
                  valueColor: AlwaysStoppedAnimation<Color>(SolarSenseColors.primaryColor),
                ),
              );
            },
          ),
      ],
    );
  }
}
