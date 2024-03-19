import 'package:flutter/cupertino.dart';
import 'package:solarsense/src/common_widgets/custom_widgets/solar_curved_edge_widget.dart';

import '../../constants/colors.dart';
import '../custom_shapes/circular_container.dart';

class PlaygroundHeader extends StatelessWidget {
  const PlaygroundHeader({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SolarCurvedEdgeWidget(
      child: Container(
        color: SolarSenseColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
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