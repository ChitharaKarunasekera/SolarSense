import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/features/core/models/products/product_model.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_list_widgets/inverter_card_widget.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../common_widgets/curved_widgets/curved_edges.dart';
import '../../../../../../common_widgets/custom_shapes/circular_container.dart';

class SolarCurvedEdgeWidget extends StatelessWidget {
  const SolarCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ClipPath(
          clipper: CustomCurvedEdges(),
          child: child
        ),
      ],
    );
  }
}