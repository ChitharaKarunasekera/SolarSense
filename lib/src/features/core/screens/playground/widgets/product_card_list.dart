import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/features/core/screens/playground/widgets/product_card_widget.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/size.dart';
import '../../../models/dashboard/top_selling_model.dart';
import '../../../models/products/product_model.dart';

class ProductCardList extends StatelessWidget {
  const ProductCardList({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {

    final list = ProductModel.list;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPressed,
          child: ProductCard(product: list[index], txtTheme: txtTheme),
        ),
      ),
    );
  }
}

