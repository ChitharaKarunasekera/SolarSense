import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/header_widgets/solar_curved_edge_widget.dart';

import '../../../../../../common_widgets/custom_widgets/app_bar_widget.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../common_widgets/custom_shapes/circular_container.dart';
import 'content_card_widget.dart';

class PlaygroundHeader extends StatelessWidget {
  const PlaygroundHeader({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return SolarCurvedEdgeWidget(
      child: Container(
        color: SolarSenseColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [

              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20), // Specify the top padding
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text("Your Statistics", style: txtTheme.titleLarge),
                            ContentCard(txtTheme: txtTheme)
                          ],
                        )
                    ),
                  )
              ),
              //Container(child: ContentCard(txtTheme: txtTheme)),
              //SolarSenseAppBar(),

              Positioned(
                  top: -150,
                  right: -200,
                  child: SolarCircularContainer(
                    backgroundColor:
                    SolarSenseColors.whiteColor.withOpacity(0.2),
                  )),
              Positioned(
                top: 100,
                right: -300,
                child: SolarCircularContainer(
                  backgroundColor:
                  SolarSenseColors.whiteColor.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}